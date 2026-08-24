variable "chimesdkvoice_sip_rules" {
  description = <<EOT
Map of chimesdkvoice_sip_rules, attributes below
Required:
    - name
    - trigger_type
    - trigger_value
    - target_applications
Optional:
    - disabled
    - region
EOT

  type = map(object({
    name                = string
    trigger_type        = string
    trigger_value       = string
    disabled            = optional(bool)
    region              = optional(string)
    target_applications = set(object({
            aws_region               = string
            priority                 = number
            sip_media_application_id = string
        }))
  }))
}
