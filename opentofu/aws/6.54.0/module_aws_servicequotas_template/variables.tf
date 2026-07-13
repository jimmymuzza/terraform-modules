variable "servicequotas_templates" {
  description = <<EOT
Map of servicequotas_templates, attributes below
Required:
    - quota_code
    - service_code
    - value
Optional:
    - aws_region
    - region
EOT

  type = map(object({
    quota_code   = string
    service_code = string
    value        = number
    aws_region   = optional(string)
    region       = optional(string)
  }))
}
