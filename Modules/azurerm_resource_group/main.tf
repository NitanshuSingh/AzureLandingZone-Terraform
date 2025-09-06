resource "azurerm_resource_group" "reesource_group" {
  for_each = var.rg
  name     = each.value.rg_name
  location = each.value.rg_location
}



