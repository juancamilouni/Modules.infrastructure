resource "azurerm_key_vault" "kv" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days = 7
  purge_protection_enabled   = true

  access_policy {
    tenant_id = var.tenant_id
    object_id = var.object_id

    key_permissions = ["Get", "List"]
    secret_permissions = ["Get", "List"]
    certificate_permissions = ["Get", "List"]
  }

  tags = var.tags
}

