variable "secretsmanager_tags" {
  description = <<EOT
Map of secretsmanager_tags, attributes below
Required:
    - key
    - secret_id
    - value
Optional:
    - region
EOT

  type = map(object({
    key       = string
    secret_id = string
    value     = string
    region    = optional(string)
  }))
}
