resource "azurerm_windows_virtual_machine" "win_vm" {
  for_each            = var.win-vm
  name                = each.value.vm-name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = "Standard_F2"
  admin_username      = "devopsuser"
  admin_password      = each.value.password
  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-10"
    sku       = "win10-22h2-pro"
    version   = "latest"
}
}

resource "azurerm_network_interface" "nic" {
  for_each            = var.win-vm
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "ipconfiguration"
    subnet_id                     = data.azurerm_subnet.subnet-data[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_network_interface_security_group_association" "nic-nsg-association" {
  for_each                  = var.win-vm
  network_interface_id      = azurerm_network_interface.nic[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg-data[each.key].id
}
