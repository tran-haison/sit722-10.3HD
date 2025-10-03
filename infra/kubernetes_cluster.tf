resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.prefix
  location            = azurerm_resource_group.my_resource_group.location
  resource_group_name = azurerm_resource_group.my_resource_group.name
  dns_prefix          = "${var.prefix}-dns"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v3"
  }

  # Use a system‐assigned managed identity
  identity {
    type = "SystemAssigned"
  }
}

# Grant AKS permission to pull images from your ACR
resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}

# Create "staging" namespace
resource "kubernetes_namespace" "staging" {
  metadata {
    name = "staging"
    labels = {
      environment = "staging"
      purpose      = "staging-environment"
      managed-by   = "opentofu"
    }
    annotations = {
      "description" = "Staging environment for testing and validation"
    }
  }
}

# Create "production" namespace
resource "kubernetes_namespace" "production" {
  metadata {
    name = "production"
    labels = {
      environment = "production"
      purpose      = "production-environment"
      managed-by   = "opentofu"
    }
    annotations = {
      "description" = "Production environment for live application"
    }
  }
}
