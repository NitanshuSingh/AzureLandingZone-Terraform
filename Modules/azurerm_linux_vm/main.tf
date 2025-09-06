resource "azurerm_network_interface" "nic" {
  for_each = var.linux-vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ipconfiguration"
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "linux-vm" {
  depends_on = [ azurerm_network_interface.nic ]
  for_each = var.linux-vm
  name                = each.value.vm-name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = "$(each.value.vm-name)-user"
  admin_password = each.value.password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

resource "azurerm_network_interface_security_group_association" "nic-nsg-association" {
  for_each = var.linux-vm
  network_interface_id = azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}

