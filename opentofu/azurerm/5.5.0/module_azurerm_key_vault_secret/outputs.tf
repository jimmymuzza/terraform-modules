output "key_vault_secrets" {
  description = "All key_vault_secret resources"
  value       = azurerm_key_vault_secret.key_vault_secrets
}
