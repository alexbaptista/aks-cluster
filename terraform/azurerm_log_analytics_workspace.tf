resource "azurerm_log_analytics_workspace" "default" {
  name                = var.log_analytics_name
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  sku                 = var.log_analytics_settings.sku
  retention_in_days   = var.log_analytics_settings.retention_in_days
  tags                = var.tags
}