variable "db_option_groups" {
  description = <<EOT
Map of db_option_groups, attributes below
Required:
    - engine_name
    - major_engine_version
Optional:
    - name
    - name_prefix
    - option_group_description
    - region
    - skip_destroy
    - tags
    - tags_all
    - option
EOT

  type = map(object({
    engine_name              = string
    major_engine_version     = string
    name                     = optional(string)
    name_prefix              = optional(string)
    option_group_description = optional(string)
    region                   = optional(string)
    skip_destroy             = optional(bool)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    option                   = optional(set(object({
            option_name                    = string
            db_security_group_memberships  = optional(set(string))
            port                           = optional(number)
            version                        = optional(string)
            vpc_security_group_memberships = optional(set(string))
            option_settings                = optional(set(object({
                name  = string
                value = string
            })))
        })))
  }))
}
