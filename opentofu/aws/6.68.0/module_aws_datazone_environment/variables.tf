variable "datazone_environments" {
  description = <<EOT
Map of datazone_environments, attributes below
Required:
    - domain_identifier
    - name
    - profile_identifier
    - project_identifier
Optional:
    - account_identifier
    - account_region
    - blueprint_identifier
    - description
    - glossary_terms
    - region
    - user_parameters
EOT

  type = map(object({
    domain_identifier    = string
    name                 = string
    profile_identifier   = string
    project_identifier   = string
    account_identifier   = optional(string)
    account_region       = optional(string)
    blueprint_identifier = optional(string)
    description          = optional(string)
    glossary_terms       = optional(list(string))
    region               = optional(string)
    user_parameters      = optional(list(object({
            name  = optional(string)
            value = optional(string)
        })))
  }))
}
