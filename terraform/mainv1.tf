provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rsg" {
  name     = "my-resource-group"
  location = "East US"  # Replace with your desired location
}

resource "azurerm_app_service_plan" "asp" {
  name                = "my-appservice-plan"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  kind                = "Linux"  # Use Linux for Node.js
  reserved            = true
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                = "mynodejs190"
  location            = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  site_config {
    linux_fx_version = "NODE|12"  # Specifies Node.js runtime
  }

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "12"  # Node.js version
  }
}
