output "key_vault_uri" {
  description = "URI del Key Vault"
  value       = azurerm_key_vault.kv.vault_uri
}
