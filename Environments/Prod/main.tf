
resource "azurerm_resource_group" "rg" {
    for_each = var.rg
    name = each.value.name
    location = each.value.location
}

# resource "azurerm_storage_account" "strg" {
#     for_each = var.strg
#     name = each.value.strg_name
#     location = azurerm_resource_group.rg[each.key].location
#     resource_group_name = azurerm_resource_group.rg[each.key].name
#     account_replication_type = "LRS"
#     account_tier = "Standard"
# }


# resource "azurerm_storage_container" "blob" {
#   for_each = var.blob
#   name = each.value.blob_name
#   storage_account_id = azurerm_storage_account.strg[each.key].id
#   container_access_type = "private"
# }



