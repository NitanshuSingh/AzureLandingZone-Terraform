resource "azurerm_container_registry" "acr" {
  for_each            = var.registries
  name                = each.value.acr_name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  admin_enabled       = false
  sku                 = "Premium"

  identity {
    type = "UserAssigned"
    identity_ids = [
      azurerm_user_assigned_identity.identity[each.key].id
    ]
  }

  lifecycle {
  prevent_destroy = true
}
}

resource "azurerm_user_assigned_identity" "identity" {
  for_each            = var.registries
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  name                = each.value.identity_name

  lifecycle {
  prevent_destroy = true
}
}
