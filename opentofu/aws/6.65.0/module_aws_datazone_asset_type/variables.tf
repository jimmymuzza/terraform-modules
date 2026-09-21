variable "datazone_asset_types" {
  description = <<EOT
Map of datazone_asset_types, attributes below
Required:
    - domain_identifier
    - name
    - owning_project_identifier
Optional:
    - description
    - region
    - forms_input
EOT

  type = map(object({
    domain_identifier         = string
    name                      = string
    owning_project_identifier = string
    description               = optional(string)
    region                    = optional(string)
    forms_input               = optional(set(object({
            map_block_key   = string
            type_identifier = string
            type_revision   = string
            required        = optional(bool)
        })))
  }))
}
