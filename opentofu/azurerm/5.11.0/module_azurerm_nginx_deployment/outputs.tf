output "nginx_deployments" {
  description = "All nginx_deployment resources"
  value       = azurerm_nginx_deployment.nginx_deployments
}
