locals {
  # All variables used in this file should be 
  # added as locals here 
  location              = var.location
  prefix                = lower(var.prefix)
  sa-name               = "datastorage${local.prefix}sa"
  
  # Common tags should go here
  tags           = {
    created_by = "Terraform"
  }
}

resource "azurerm_storage_account" "sa" {
  name                = local.sa-name 
  resource_group_name = data.azurerm_resource_group.project-rg.name

  location                 = local.location 
  account_tier             = "Standard"
  account_replication_type = "ZRS"

  # network_rules {
  #   default_action             = "Deny"
  #   ip_rules                   = ["100.0.0.1"]
  #   virtual_network_subnet_ids = [azurerm_subnet.example.id]
  # }

  tags = local.tags
}

resource "azurerm_storage_container" "output" {
  name                  = "output"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "input" {
  name                  = "input"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}
