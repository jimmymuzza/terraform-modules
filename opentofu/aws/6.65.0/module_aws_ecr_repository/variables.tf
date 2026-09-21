variable "ecr_repositories" {
  description = <<EOT
Map of ecr_repositories, attributes below
Required:
    - name
Optional:
    - force_delete
    - image_tag_mutability
    - region
    - tags
    - tags_all
    - encryption_configuration
    - image_scanning_configuration
    - image_tag_mutability_exclusion_filter
EOT

  type = map(object({
    name                                  = string
    force_delete                          = optional(bool)
    image_tag_mutability                  = optional(string)
    region                                = optional(string)
    tags                                  = optional(map(string))
    tags_all                              = optional(map(string))
    encryption_configuration              = optional(list(object({
            encryption_type = optional(string)
            kms_key         = optional(string)
        })))
    image_scanning_configuration          = optional(list(object({
            scan_on_push = bool
        })))
    image_tag_mutability_exclusion_filter = optional(list(object({
            filter      = string
            filter_type = string
        })))
  }))
}
