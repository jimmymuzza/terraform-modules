variable "web_pubsub_custom_certificates" {
  description = <<EOT
Map of web_pubsub_custom_certificates, attributes below
Required:
    - custom_certificate_id
    - name
    - web_pubsub_id
EOT

  type = map(object({
    custom_certificate_id = string
    name                  = string
    web_pubsub_id         = string
  }))
}
