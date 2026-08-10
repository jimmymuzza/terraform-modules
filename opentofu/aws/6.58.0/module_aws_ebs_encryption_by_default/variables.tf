variable "ebs_encryption_by_defaults" {
  description = <<EOT
Map of ebs_encryption_by_defaults, attributes below
Optional:
    - enabled
    - region
EOT

  type = map(object({
    enabled = optional(bool)
    region  = optional(string)
  }))
}
