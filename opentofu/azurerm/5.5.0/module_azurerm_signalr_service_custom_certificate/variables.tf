variable "signalr_service_custom_certificates" {
  description = <<EOT
Map of signalr_service_custom_certificates, attributes below
Required:
    - custom_certificate_id
    - name
    - signalr_service_id
EOT

  type = map(object({
    custom_certificate_id = string
    name                  = string
    signalr_service_id    = string
  }))
}
