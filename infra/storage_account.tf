resource "azurerm_storage_account" "my_storage_account" {
  name                     = var.prefix
  resource_group_name      = var.prefix
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
    purpose     = "general-storage"
  }
}
