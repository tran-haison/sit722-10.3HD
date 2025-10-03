resource "azurerm_container_registry" "acr" {
  name                = var.prefix
  resource_group_name = azurerm_resource_group.my_resource_group.name
  location            = azurerm_resource_group.my_resource_group.location
  sku                 = "Basic"
  admin_enabled       = true
}
