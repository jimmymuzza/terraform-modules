variable "signalr_service_custom_domains" {
  description = <<EOT
Map of signalr_service_custom_domains, attributes below
Required:
    - domain_name
    - name
    - signalr_custom_certificate_id
    - signalr_service_id
EOT

  type = map(object({
    domain_name                   = string
    name                          = string
    signalr_custom_certificate_id = string
    signalr_service_id            = string
  }))
}
