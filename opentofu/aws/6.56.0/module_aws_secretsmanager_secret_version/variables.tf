variable "secretsmanager_secret_versions" {
  description = <<EOT
Map of secretsmanager_secret_versions, attributes below
Required:
    - secret_id
Optional:
    - region
    - secret_binary
    - secret_string
    - secret_string_wo
    - secret_string_wo_version
    - version_stages
EOT

  type = map(object({
    secret_id                = string
    region                   = optional(string)
    secret_binary            = optional(string)
    secret_string            = optional(string)
    secret_string_wo         = optional(string)
    secret_string_wo_version = optional(number)
    version_stages           = optional(set(string))
  }))
}
