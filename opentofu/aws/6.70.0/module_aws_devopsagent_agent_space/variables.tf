variable "devopsagent_agent_spaces" {
  description = <<EOT
Map of devopsagent_agent_spaces, attributes below
Required:
    - name
Optional:
    - description
    - kms_key_arn
    - locale
    - region
    - tags
EOT

  type = map(object({
    name        = string
    description = optional(string)
    kms_key_arn = optional(string)
    locale      = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
