variable "datazone_form_types" {
  description = <<EOT
Map of datazone_form_types, attributes below
Required:
    - domain_identifier
    - name
    - owning_project_identifier
Optional:
    - description
    - region
    - status
    - model
EOT

  type = map(object({
    domain_identifier         = string
    name                      = string
    owning_project_identifier = string
    description               = optional(string)
    region                    = optional(string)
    status                    = optional(string)
    model                     = optional(list(object({
            smithy = string
        })))
  }))
}
