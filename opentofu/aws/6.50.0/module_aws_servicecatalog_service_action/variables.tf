variable "servicecatalog_service_actions" {
  description = <<EOT
Map of servicecatalog_service_actions, attributes below
Required:
    - name
    - definition
Optional:
    - accept_language
    - description
    - region
EOT

  type = map(object({
    name            = string
    accept_language = optional(string)
    description     = optional(string)
    region          = optional(string)
    definition      = list(object({
            name        = string
            version     = string
            assume_role = optional(string)
            parameters  = optional(string)
            type        = optional(string)
        }))
  }))
}
