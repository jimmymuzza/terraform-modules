variable "rolesanywhere_trust_anchors" {
  description = <<EOT
Map of rolesanywhere_trust_anchors, attributes below
Required:
    - name
    - source
Optional:
    - enabled
    - tags
    - tags_all
    - notification_settings
EOT

  type = map(object({
    name                  = string
    enabled               = optional(bool)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    notification_settings = optional(set(object({
            channel   = optional(string)
            enabled   = optional(bool)
            event     = optional(string)
            threshold = optional(number)
        })))
    source                = list(object({
            source_type = string
            source_data = list(object({
                acm_pca_arn           = optional(string)
                x509_certificate_data = optional(string)
            }))
        }))
  }))
}
