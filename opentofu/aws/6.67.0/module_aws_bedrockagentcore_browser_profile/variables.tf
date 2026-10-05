variable "bedrockagentcore_browser_profiles" {
  description = <<EOT
Map of bedrockagentcore_browser_profiles, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
EOT

  type = map(object({
    name        = string
    description = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
