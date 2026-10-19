variable "redshift_parameter_groups" {
  description = <<EOT
Map of redshift_parameter_groups, attributes below
Required:
    - family
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - parameter
EOT

  type = map(object({
    family      = string
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    parameter   = optional(set(object({
            name  = string
            value = string
        })))
  }))
}
