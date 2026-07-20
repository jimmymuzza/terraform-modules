variable "web_pubsub_custom_domains" {
  description = <<EOT
Map of web_pubsub_custom_domains, attributes below
Required:
    - domain_name
    - name
    - web_pubsub_custom_certificate_id
    - web_pubsub_id
EOT

  type = map(object({
    domain_name                      = string
    name                             = string
    web_pubsub_custom_certificate_id = string
    web_pubsub_id                    = string
  }))
}
