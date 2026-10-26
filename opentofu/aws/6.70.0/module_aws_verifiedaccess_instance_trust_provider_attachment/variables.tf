variable "verifiedaccess_instance_trust_provider_attachments" {
  description = <<EOT
Map of verifiedaccess_instance_trust_provider_attachments, attributes below
Required:
    - verifiedaccess_instance_id
    - verifiedaccess_trust_provider_id
Optional:
    - region
EOT

  type = map(object({
    verifiedaccess_instance_id       = string
    verifiedaccess_trust_provider_id = string
    region                           = optional(string)
  }))
}
