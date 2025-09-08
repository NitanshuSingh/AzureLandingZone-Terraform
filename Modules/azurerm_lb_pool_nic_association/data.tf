data "azurerm_lb" "lb-data" {
  for_each = var.association
  name                = each.value.lb_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "lb-pool-data" {
  for_each = var.association
  name            = each.value.lb_pool_name
  loadbalancer_id = data.azurerm_lb.lb-data[each.key].id
}

data "azurerm_network_interface" "nic-data" {
  for_each = var.association
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}