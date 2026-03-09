variable "route53_zones" {
  description = <<EOT
Map of route53_zones, attributes below
Required:
    - name
Optional:
    - comment
    - delegation_set_id
    - enable_accelerated_recovery
    - force_destroy
    - tags
    - tags_all
    - vpc
EOT

  type = map(object({
    name                        = string
    comment                     = optional(string)
    delegation_set_id           = optional(string)
    enable_accelerated_recovery = optional(bool)
    force_destroy               = optional(bool)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    vpc                         = optional(set(object({
            vpc_id     = string
            vpc_region = optional(string)
        })))
  }))
}
