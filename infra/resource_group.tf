resource "azurerm_resource_group" "my_resource_group" {
  name     = var.prefix
  location = var.location
}
