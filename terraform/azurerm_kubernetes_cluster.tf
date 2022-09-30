resource "azurerm_kubernetes_cluster" "default" {
  name                              = var.aks_name
  location                          = azurerm_resource_group.default.location
  resource_group_name               = azurerm_resource_group.default.name
  dns_prefix                        = var.aks_settings.dns_prefix
  role_based_access_control_enabled = var.aks_settings.role_based_access_control_enabled
  api_server_authorized_ip_ranges   = var.aks_settings.api_server_authorized_ip_ranges
  azure_policy_enabled              = var.aks_settings.azure_policy_enabled

  default_node_pool {
    name            = var.aks_default_node.name
    node_count      = var.aks_default_node.node_count
    os_disk_size_gb = var.aks_default_node.os_disk_size_gb
    vm_size         = var.aks_default_node.vm_size
  }

  network_profile {
    network_policy = var.aks_settings.network_profile.network_policy
    network_plugin = var.aks_settings.network_profile.network_plugin
  }

  identity {
    type = var.aks_settings.identity.type
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.default.id
  }

  tags = var.tags
}