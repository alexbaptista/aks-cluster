resource "azurerm_resource_group" "default" {
  name     = var.resourcegroup_name
  location = var.location
  tags     = var.tags
}