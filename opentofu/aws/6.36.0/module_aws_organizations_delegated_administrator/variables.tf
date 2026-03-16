variable "organizations_delegated_administrators" {
  description = <<EOT
Map of organizations_delegated_administrators, attributes below
Required:
    - account_id
    - service_principal
EOT

  type = map(object({
    account_id        = string
    service_principal = string
  }))
}
