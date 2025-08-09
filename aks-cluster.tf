terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.34.0"
    }
  }

}


provider "azurerm" {
  features {}
  subscription_id = "9f199aee-1ad7-464f-bd74-4b88ef990086"


  
}

resource "azurerm_resource_group" "resource" {
  name     = "bhawesh_rg"
  location = "West US "
}
  

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "bhawesh-aks"
  location            = "West US"
  resource_group_name = "bhawesh_rg"
  dns_prefix          = "soumya-k8s"
  kubernetes_version  = "1.32.6"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_A2_v2"
    os_disk_size_gb = 30
  }

 
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

 
}
