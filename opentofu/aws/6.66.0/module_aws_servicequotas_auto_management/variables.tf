variable "servicequotas_auto_managements" {
  description = <<EOT
Map of servicequotas_auto_managements, attributes below
Required:
    - opt_in_level
    - opt_in_type
Optional:
    - exclusion_list
    - notification_arn
    - region
EOT

  type = map(object({
    opt_in_level     = string
    opt_in_type      = string
    exclusion_list   = optional(map(list(string)))
    notification_arn = optional(string)
    region           = optional(string)
  }))
}
