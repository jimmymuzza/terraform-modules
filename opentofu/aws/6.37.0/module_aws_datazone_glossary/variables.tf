variable "datazone_glossaries" {
  description = <<EOT
Map of datazone_glossaries, attributes below
Required:
    - domain_identifier
    - name
    - owning_project_identifier
Optional:
    - description
    - region
    - status
EOT

  type = map(object({
    domain_identifier         = string
    name                      = string
    owning_project_identifier = string
    description               = optional(string)
    region                    = optional(string)
    status                    = optional(string)
  }))
}
