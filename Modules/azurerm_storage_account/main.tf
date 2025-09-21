resource "azurerm_storage_account" "strg" {
  for_each                 = var.strg
  name                     = each.value.storage_account_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
    # ✅ Allow only selected networks
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    virtual_network_subnet_ids = [data.azurerm_subnet.subnet-data[each.key].id]
  }
}

data "azurerm_subnet" "subnet-data" {
  for_each = var.strg
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_storage_container" "container" {
    depends_on = [ azurerm_storage_account.strg ]
    for_each = var.blob
    name = each.value.blob_name
    storage_account_id = azurerm_storage_account.strg[each.key].id 
}

