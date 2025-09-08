resource "azurerm_lb" "lb" {
    for_each = var.lb
  name                = each.value.lb_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_name
    public_ip_address_id = data.azurerm_public_ip.pip-data[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "address-pool" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lb_pool_name
}

resource "azurerm_lb_probe" "probe" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.lb_probe_name
  port            = 22
}

resource "azurerm_lb_rule" "lb-rule" {
  for_each = var.lb
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name                           = each.value.lb_rule_name
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.lb[each.key].frontend_ip_configuration[0].name
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.address-pool[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}



