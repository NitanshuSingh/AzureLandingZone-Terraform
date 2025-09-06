data "azurerm_subnet" "subnet-data" {
  for_each = var.linux-vm
  name = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_security_group" "nsg-data" {
  for_each = var.linux-vm
  name = each.value.nsg_name
  resource_group_name = each.value.resource_group_name
}