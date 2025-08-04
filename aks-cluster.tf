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
  subscription_id = "7612edd3-0c0f-4529-a4c1-b982bc1fdb9b"


  
}

resource "azurerm_resource_group" "resource1" {
  name     = "bhawesh-rg2"
  location = "West US "
}
  

resource "azurerm_kubernetes_cluster" "kubernetes" {
  name                = "bhawesh-aks"
  location            = "West US"
  resource_group_name = "bhawesh-rg2"
  dns_prefix          = "bhawesh-k8s"
  kubernetes_version  = "1.32.6"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2ps_v6"
    os_disk_size_gb = 30
  }

 
  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = true

 
}
