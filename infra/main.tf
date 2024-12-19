Here is a basic example of how you can define these resources using Terraform. This example is not exhaustive and you may need to adjust it to fit your specific needs.

```hcl
provider "azurerm" {
  version = "~>2.0"
  features {}
}

module "app_service" {
  source  = "Azure/app-service/azurerm"
  version = "1.0.0"

  name                = "my-app-service"
  resource_group_name = "my-resource-group"
  location            = "West Europe"
  app_service_plan_id = azurerm_app_service_plan.example.id
}

resource "azurerm_app_service_plan" "example" {
  name                = "my-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  sku {
    tier = "Standard"
    size = "A4v2"
  }
}

resource "azurerm_sql_database" "example" {
  name                = "my-sql-database"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  server_name         = azurerm_sql_server.example.name
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  edition             = "Standard"
  requested_service_objective_name = "S0"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_cdn_profile" "example" {
  name                = "my-cdn-profile"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Standard_Microsoft"
}

resource "azurerm_monitor_diagnostic_setting" "example" {
  name                       = "my-monitor-setting"
  target_resource_id         = azurerm_virtual_machine.example.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.example.id

  log {
    category = "AuditEvent"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }
}
```

This code creates an Azure App Service, an Azure SQL Database, an Azure Storage Account, a CDN profile, and a Monitor Diagnostic Setting. The code is modular, meaning each resource is defined in its own block and can be managed independently. The code also follows best practices, such as using a provider block to configure the Azure provider and using resource blocks to define each resource.