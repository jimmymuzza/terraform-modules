variable "datazone_user_profiles" {
  description = <<EOT
Map of datazone_user_profiles, attributes below
Required:
    - domain_identifier
    - user_identifier
Optional:
    - region
    - status
    - user_type
EOT

  type = map(object({
    domain_identifier = string
    user_identifier   = string
    region            = optional(string)
    status            = optional(string)
    user_type         = optional(string)
  }))
}
