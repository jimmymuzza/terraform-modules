variable "ecr_repository_creation_templates" {
  description = <<EOT
Map of ecr_repository_creation_templates, attributes below
Required:
    - applied_for
    - prefix
Optional:
    - custom_role_arn
    - description
    - image_tag_mutability
    - lifecycle_policy
    - region
    - repository_policy
    - resource_tags
    - encryption_configuration
    - image_tag_mutability_exclusion_filter
EOT

  type = map(object({
    applied_for                           = set(string)
    prefix                                = string
    custom_role_arn                       = optional(string)
    description                           = optional(string)
    image_tag_mutability                  = optional(string)
    lifecycle_policy                      = optional(string)
    region                                = optional(string)
    repository_policy                     = optional(string)
    resource_tags                         = optional(map(string))
    encryption_configuration              = optional(list(object({
            encryption_type = optional(string)
            kms_key         = optional(string)
        })))
    image_tag_mutability_exclusion_filter = optional(list(object({
            filter      = string
            filter_type = string
        })))
  }))
}
