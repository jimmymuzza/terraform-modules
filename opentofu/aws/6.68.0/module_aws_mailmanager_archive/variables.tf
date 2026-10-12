variable "mailmanager_archives" {
  description = <<EOT
Map of mailmanager_archives, attributes below
Required:
    - name
Optional:
    - kms_key_arn
    - region
    - tags
    - retention
EOT

  type = map(object({
    name        = string
    kms_key_arn = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    retention   = optional(list(object({
            retention_period = string
        })))
  }))
}
