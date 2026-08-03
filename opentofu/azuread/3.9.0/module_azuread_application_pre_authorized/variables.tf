variable "application_pre_authorizeds" {
  description = <<EOT
Map of application_pre_authorizeds, attributes below
Required:
    - application_id
    - authorized_client_id
    - permission_ids
EOT

  type = map(object({
    application_id       = string
    authorized_client_id = string
    permission_ids       = set(string)
  }))
}
