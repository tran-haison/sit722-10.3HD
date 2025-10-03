resource "azurerm_container_registry" "acr" {
  name                = var.prefix
  resource_group_name = var.prefix
  location            = var.location
  sku                 = "Basic"
  admin_enabled       = true
}
