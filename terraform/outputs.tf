output "resource_group_name" {
  value       = azurerm_resource_group.default.name
  description = "Name of resource group"
}

output "kubernetes_cluster_name" {
  value       = azurerm_kubernetes_cluster.default.name
  description = "Name of AKS Cluster"
}

output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.default.name
  description = "Name of Log Analytics"
}

output "host" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.host
  description = "AKS Host"
  sensitive   = true
}

output "client_key" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.client_key
  description = "AKS Client Key"
  sensitive   = true
}

output "client_certificate" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.client_certificate
  description = "AKS Client certificate"
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.cluster_ca_certificate
  description = "AKS Client CA certificate"
  sensitive   = true
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.default.kube_config_raw
  sensitive   = true
  description = "AKS Config raw"
}

output "cluster_username" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.username
  description = "AKS User name"
  sensitive   = true
}

output "cluster_password" {
  value       = azurerm_kubernetes_cluster.default.kube_config.*.password
  description = "AKS Password"
  sensitive   = true
}

output "key_vault_id" {
  value = azurerm_key_vault.default.id
  description = "Keyvault ID"
}