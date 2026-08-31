variable "route53recoveryreadiness_readiness_checks" {
  description = <<EOT
Map of route53recoveryreadiness_readiness_checks, attributes below
Required:
    - readiness_check_name
    - resource_set_name
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    readiness_check_name = string
    resource_set_name    = string
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
