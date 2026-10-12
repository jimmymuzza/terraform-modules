variable "kms_alias" {
  description = <<EOT
Map of kms_alias, attributes below
Required:
    - target_key_id
Optional:
    - name
    - name_prefix
    - region
EOT

  type = map(object({
    target_key_id = string
    name          = optional(string)
    name_prefix   = optional(string)
    region        = optional(string)
  }))
}
