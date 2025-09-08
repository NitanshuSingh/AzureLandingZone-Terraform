resource "azurerm_storage_account" "strg" {
  for_each                 = var.strg
  name                     = each.value.storage_account_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
    depends_on = [ azurerm_storage_account.strg ]
    for_each = var.blob
    name = each.value.blob-name
    storage_account_id = azurerm_storage_account.strg.id 
}

