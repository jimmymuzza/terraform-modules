variable "ebs_default_kms_keys" {
  description = <<EOT
Map of ebs_default_kms_keys, attributes below
Required:
    - key_arn
Optional:
    - region
EOT

  type = map(object({
    key_arn = string
    region  = optional(string)
  }))
}
