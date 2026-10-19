variable "shield_protection_health_check_associations" {
  description = <<EOT
Map of shield_protection_health_check_associations, attributes below
Required:
    - health_check_arn
    - shield_protection_id
EOT

  type = map(object({
    health_check_arn     = string
    shield_protection_id = string
  }))
}
