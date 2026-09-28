variable "organizations_aws_service_accesses" {
  description = <<EOT
Map of organizations_aws_service_accesses, attributes below
Required:
    - service_principal
EOT

  type = map(object({
    service_principal = string
  }))
}
