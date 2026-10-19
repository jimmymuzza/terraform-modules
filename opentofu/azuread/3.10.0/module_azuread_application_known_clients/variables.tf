variable "application_known_clients" {
  description = <<EOT
Map of application_known_clients, attributes below
Required:
    - application_id
    - known_client_ids
EOT

  type = map(object({
    application_id   = string
    known_client_ids = set(string)
  }))
}
