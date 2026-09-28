variable "emr_security_configurations" {
  description = <<EOT
Map of emr_security_configurations, attributes below
Required:
    - configuration
Optional:
    - name
    - name_prefix
    - region
EOT

  type = map(object({
    configuration = string
    name          = optional(string)
    name_prefix   = optional(string)
    region        = optional(string)
  }))
}
