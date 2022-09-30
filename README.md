# aks-argocd
Proof of Concept for AKS Cluster

> **_NOTE:_** Azure Pipelines (Azure DevOps) being used by template - https://github.com/alexbaptista/azuredevops-iac-template-pipeline

<br /><img src="README_content/terraform.png" width="100">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="README_content/aks.png" width="100"><br />

### **Folder structure**

```
├── argocd
│   └── v2.4.12
│       └── manifests
│           ├── install.yaml
│           └── namespace.yaml
├── azure-pipelines.yaml
└── terraform
    ├── README.md
    ├── azurerm_client_config.tf
    ├── azurerm_key_vault.tf
    ├── azurerm_key_vault_secret.tf
    ├── azurerm_kubernetes_cluster.tf
    ├── azurerm_log_analytics_workspace.tf
    ├── azurerm_resource_group.tf
    ├── kubectl_file_documents.tf
    ├── kubectl_manifest.tf
    ├── kubernetes_secret.tf
    ├── main.tf
    ├── outputs.tf
    ├── random_string.tf
    └── variables.tf
```

* **[terraform/*](terraform)**: This folder contains Terraform files. The documentation can be acessed [here](terraform/README.md)

## **What does it will create ?**

* **Azure Kubernetes Service**: Kubernetes managed by Azure Cloud;
  
* **Azure KeyVault Service**: To store ArgoCD admin password.

## **Next Steps**

* **Get Access AKS**: https://learn.microsoft.com/en-us/azure/aks/manage-azure-rbac#use-azure-rbac-for-kubernetes-authorization-with-kubectl

* **Run portfoward to access ArgoCD**: https://argo-cd.readthedocs.io/en/stable/getting_started/#port-forwarding

## **Notes**

After Terraform done, is necessary to give permission to appropriate users for Keyvault.

Initially, the access is only granted for tenant user used to run Terraform

How to do: https://learn.microsoft.com/en-us/azure/key-vault/general/assign-access-policy?tabs=azure-portal

## **References**

* https://azure.microsoft.com/en-us/products/key-vault/
* https://azure.microsoft.com/en-us/products/kubernetes-service/