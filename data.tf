data "azurerm_client_config" "current" {}
data "azurerm_resource_group" "project-rg" {
    name = var.project-rg 
}
