resource "azurerm_network_interface_backend_address_pool_association" "lb-nic-assoc" {
  for_each = var.association
  network_interface_id    = data.azurerm_network_interface.nic-data[each.key].id
  ip_configuration_name   = "ipconfiguration"
  backend_address_pool_id = data.azurerm_lb_backend_address_pool.lb-pool-data[each.key].id
}


