variable "xray_encryption_configs" {
  description = <<EOT
Map of xray_encryption_configs, attributes below
Required:
    - type
Optional:
    - key_id
    - region
EOT

  type = map(object({
    type   = string
    key_id = optional(string)
    region = optional(string)
  }))
}
