resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  
  name                     = "storageaccountname1234"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  public_network_access_enabled = var.public_network_access_enabled
  tags = {
    environment = "staging"
  }
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
}

variable "public_network_access_enabled" {
  default = "true"
  
}