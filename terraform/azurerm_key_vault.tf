resource "azurerm_key_vault" "default" {
  name                        = "${var.keyvault_name_prefix}${random_string.random.result}"
  location                    = azurerm_resource_group.default.location
  resource_group_name         = azurerm_resource_group.default.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  enabled_for_disk_encryption = var.keyvault_settings.enabled_for_disk_encryption
  soft_delete_retention_days  = var.keyvault_settings.soft_delete_retention_days
  purge_protection_enabled    = var.keyvault_settings.purge_protection_enabled
  sku_name                    = var.keyvault_settings.sku_name

  access_policy {
    tenant_id          = data.azurerm_client_config.current.tenant_id
    object_id          = data.azurerm_client_config.current.object_id
    key_permissions    = var.keyvault_settings.access_policy.key_permissions
    secret_permissions = var.keyvault_settings.access_policy.secret_permissions
  }

  network_acls {
    bypass         = var.keyvault_settings.network_acls.bypass
    default_action = var.keyvault_settings.network_acls.default_action
    ip_rules       = var.keyvault_settings.network_acls.ip_rules
  }

  tags = var.tags
}