resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "log-${var.project_name}-${random_string.suffix.result}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30 # Mínimo permitido por Azure
  tags                = var.tags
}

resource "azurerm_storage_account" "diag_storage" {
  name                     = "lzdiagstorage${random_string.suffix.result}"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags

  # lifecycle {
  #   prevent_destroy = true
  # }
}

resource "azurerm_storage_management_policy" "retention" {
  storage_account_id = azurerm_storage_account.diag_storage.id

  rule {
    name    = "log-retention"
    enabled = true

    filters {
      blob_types   = ["blockBlob"]
      prefix_match = ["logs/"]
    }

    actions {
      base_blob {
        delete_after_days_since_modification_greater_than = 30
      }
    }
  }
}

resource "azurerm_monitor_diagnostic_setting" "diagnostics" {
  name                       = "send-diagnostics"
  target_resource_id         = azurerm_log_analytics_workspace.log_analytics.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics.id
  storage_account_id         = azurerm_storage_account.diag_storage.id

  metric {
    category = "AllMetrics"
    enabled  = true
  }
}
