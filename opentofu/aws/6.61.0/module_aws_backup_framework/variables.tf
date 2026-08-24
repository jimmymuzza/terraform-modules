variable "backup_frameworks" {
  description = <<EOT
Map of backup_frameworks, attributes below
Required:
    - name
    - control
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
    control     = set(object({
            name            = string
            input_parameter = optional(set(object({
                name  = optional(string)
                value = optional(string)
            })))
            scope           = optional(list(object({
                compliance_resource_ids   = optional(set(string))
                compliance_resource_types = optional(set(string))
                tags                      = optional(map(string))
            })))
        }))
  }))
}
