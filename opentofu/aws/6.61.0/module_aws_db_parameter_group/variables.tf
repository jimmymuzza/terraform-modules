variable "db_parameter_groups" {
  description = <<EOT
Map of db_parameter_groups, attributes below
Required:
    - family
Optional:
    - description
    - name
    - name_prefix
    - region
    - skip_destroy
    - tags
    - tags_all
    - parameter
EOT

  type = map(object({
    family       = string
    description  = optional(string)
    name         = optional(string)
    name_prefix  = optional(string)
    region       = optional(string)
    skip_destroy = optional(bool)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    parameter    = optional(set(object({
            name         = string
            value        = string
            apply_method = optional(string)
        })))
  }))
}
