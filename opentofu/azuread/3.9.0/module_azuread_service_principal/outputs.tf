output "service_principals" {
  description = "All service_principal resources"
  value       = azuread_service_principal.service_principals
}
