variable "location" {
  type        = string
  default     = "East US"
  description = "Azure region for resources"
}

variable "resourcegroup_name" {
  type        = string
  default     = "resourcegroup-aks"
  description = "Resource Group name"
}

variable "log_analytics_name" {
  type        = string
  default     = "log-aks"
  description = "Log Analytics name"
}

variable "log_analytics_settings" {
  type = object({
    retention_in_days = number
    sku               = string
  })
  default = {
    retention_in_days = 30
    sku               = "PerGB2018"
  }
  description = "Log Analytics settings"
}

variable "aks_name" {
  type        = string
  default     = "infra-aks"
  description = "AKS Cluster name"
}

variable "aks_default_node" {
  type = object({
    name            = string
    node_count      = number
    os_disk_size_gb = number
    vm_size         = string
  })
  default = {
    name            = "default"
    node_count      = 1
    os_disk_size_gb = 30
    vm_size         = "Standard_D2_v2"
  }
  description = "Settings for AKS Node Cluster"
}

variable "aks_settings" {
  type = object({
    api_server_authorized_ip_ranges = list(string)
    azure_policy_enabled            = bool
    dns_prefix                      = string
    identity = object({
      type = string
    })
    network_profile = object({
      network_policy = string
      network_plugin = string
    })
    oms_agent = object({
      log_analytics_workspace_id = string
    })
    role_based_access_control_enabled = bool
  })
  default = {
    api_server_authorized_ip_ranges = ["177.33.139.44/32", "168.61.176.250/32"]
    azure_policy_enabled            = true
    dns_prefix                      = "k8s"
    identity = {
      type = "SystemAssigned"
    }
    network_profile = {
      network_plugin = "kubenet"
      network_policy = "calico"
    }
    oms_agent = {
      log_analytics_workspace_id = "3a00c7dd-5a70-4a82-9903-d7dd1d8adce3"
    }
    role_based_access_control_enabled = true
  }
  description = "Settings for AKS Cluster"
}

variable "keyvault_name_prefix" {
  type        = string
  default     = "KeyvaultAks"
  description = "Keyvault name"
}

variable "keyvault_settings" {
  type = object({
    access_policy = object({
      key_permissions    = list(string)
      secret_permissions = list(string)
    })
    enabled_for_disk_encryption = bool
    purge_protection_enabled    = bool
    network_acls = object({
      bypass         = string
      default_action = string
      ip_rules       = list(string)
    })
    sku_name                   = string
    soft_delete_retention_days = number
  })
  default = {
    access_policy = {
      key_permissions = [
        "Create",
        "Get",
      ]
      secret_permissions = [
        "Set",
        "Get",
        "Delete",
        "Purge",
        "Recover"
      ]
    }
    enabled_for_disk_encryption = true
    purge_protection_enabled    = true
    network_acls = {
      bypass         = "AzureServices"
      default_action = "Deny"
      ip_rules       = ["177.33.139.44/32", "168.61.176.250/32"]
    }
    sku_name                   = "standard"
    soft_delete_retention_days = 7
  }
  description = "Keyvault settings"
}

variable "tags" {
  type = map(string)
  default = {
    "Repository"   = "https://github.com/alexbaptista/azuredevops-iac-template-pipeline"
    "Environment"  = "Infra"
    "MaintainedBy" = "Terraform"
    "Purpose"      = "Call"
  }
  description = "Relation from TAGS to include in resources"
}