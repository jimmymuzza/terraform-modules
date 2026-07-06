variable "application_api_accesses" {
  description = <<EOT
Map of application_api_accesses, attributes below
Required:
    - api_client_id
    - application_id
Optional:
    - role_ids
    - scope_ids
EOT

  type = map(object({
    api_client_id  = string
    application_id = string
    role_ids       = optional(set(string))
    scope_ids      = optional(set(string))
  }))
}
