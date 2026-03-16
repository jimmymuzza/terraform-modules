variable "route53recoveryreadiness_resource_sets" {
  description = <<EOT
Map of route53recoveryreadiness_resource_sets, attributes below
Required:
    - resource_set_name
    - resource_set_type
    - resources
Optional:
    - tags
    - tags_all
EOT

  type = map(object({
    resource_set_name = string
    resource_set_type = string
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    resources         = list(object({
            readiness_scopes    = optional(list(string))
            resource_arn        = optional(string)
            dns_target_resource = optional(list(object({
                domain_name     = string
                hosted_zone_arn = optional(string)
                record_set_id   = optional(string)
                record_type     = optional(string)
                target_resource = optional(list(object({
                    nlb_resource = optional(list(object({
                        arn = optional(string)
                    })))
                    r53_resource = optional(list(object({
                        domain_name   = optional(string)
                        record_set_id = optional(string)
                    })))
                })))
            })))
        }))
  }))
}
