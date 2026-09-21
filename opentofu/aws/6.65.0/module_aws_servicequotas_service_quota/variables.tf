variable "servicequotas_service_quotas" {
  description = <<EOT
Map of servicequotas_service_quotas, attributes below
Required:
    - quota_code
    - service_code
    - value
Optional:
    - region
EOT

  type = map(object({
    quota_code   = string
    service_code = string
    value        = number
    region       = optional(string)
  }))
}
