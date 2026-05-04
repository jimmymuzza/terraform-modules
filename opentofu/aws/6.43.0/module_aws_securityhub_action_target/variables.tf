variable "securityhub_action_targets" {
  description = <<EOT
Map of securityhub_action_targets, attributes below
Required:
    - description
    - identifier
    - name
Optional:
    - region
EOT

  type = map(object({
    description = string
    identifier  = string
    name        = string
    region      = optional(string)
  }))
}
