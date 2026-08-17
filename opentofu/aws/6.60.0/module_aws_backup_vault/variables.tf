variable "backup_vaults" {
  description = <<EOT
Map of backup_vaults, attributes below
Required:
    - name
Optional:
    - force_destroy
    - kms_key_arn
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name          = string
    force_destroy = optional(bool)
    kms_key_arn   = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
