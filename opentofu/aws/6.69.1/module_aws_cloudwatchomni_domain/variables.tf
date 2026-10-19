variable "cloudwatchomni_domains" {
  description = <<EOT
Map of cloudwatchomni_domains, attributes below
Required:
    - identity_providers
    - name
Optional:
    - region
    - identity_provider_configuration
EOT

  type = map(object({
    identity_providers              = set(string)
    name                            = string
    region                          = optional(string)
    identity_provider_configuration = optional(list(object({
            identity_center_configuration = optional(list(object({
                identity_center_instance_arn = string
            })))
        })))
  }))
}
