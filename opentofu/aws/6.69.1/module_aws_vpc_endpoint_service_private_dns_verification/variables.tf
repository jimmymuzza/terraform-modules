variable "vpc_endpoint_service_private_dns_verifications" {
  description = <<EOT
Map of vpc_endpoint_service_private_dns_verifications, attributes below
Required:
    - service_id
Optional:
    - region
    - wait_for_verification
EOT

  type = map(object({
    service_id            = string
    region                = optional(string)
    wait_for_verification = optional(bool)
  }))
}
