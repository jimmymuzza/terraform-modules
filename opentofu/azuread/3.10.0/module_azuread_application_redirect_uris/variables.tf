variable "application_redirect_uris" {
  description = <<EOT
Map of application_redirect_uris, attributes below
Required:
    - application_id
    - redirect_uris
    - type
EOT

  type = map(object({
    application_id = string
    redirect_uris  = set(string)
    type           = string
  }))
}
