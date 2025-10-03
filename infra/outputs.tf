# Resource Group Output (manually created)
output "resource_group_name" {
  description = "Name of the manually created Azure Resource Group"
  value       = var.prefix
}

output "resource_group_location" {
  description = "Location of the manually created Azure Resource Group"
  value       = var.location
}

# AKS Cluster Outputs
output "cluster_name" {
  description = "Name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}

output "cluster_fqdn" {
  description = "FQDN of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.fqdn
}

output "cluster_kube_config" {
  description = "Kubernetes configuration for the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
}

# Container Registry Outputs
output "acr_name" {
  description = "Name of the Azure Container Registry"
  value       = azurerm_container_registry.acr.name
}

output "acr_login_server" {
  description = "Login server of the Azure Container Registry"
  value       = azurerm_container_registry.acr.login_server
}

# Storage Account Outputs
output "storage_account_name" {
  description = "Name of the Azure Storage Account"
  value       = azurerm_storage_account.my_storage_account.name
}

output "storage_account_primary_endpoint" {
  description = "Primary endpoint of the Azure Storage Account"
  value       = azurerm_storage_account.my_storage_account.primary_blob_endpoint
}

# Namespace Outputs
output "staging_namespace" {
  description = "Staging namespace name"
  value       = kubernetes_namespace.staging.metadata[0].name
}

output "production_namespace" {
  description = "Production namespace name"
  value       = kubernetes_namespace.production.metadata[0].name
}
