variable "application_identifier_uris" {
  description = <<EOT
Map of application_identifier_uris, attributes below
Required:
    - application_id
    - identifier_uri
EOT

  type = map(object({
    application_id = string
    identifier_uri = string
  }))
}
