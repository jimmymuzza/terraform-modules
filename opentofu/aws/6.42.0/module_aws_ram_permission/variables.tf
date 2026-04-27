variable "ram_permissions" {
  description = <<EOT
Map of ram_permissions, attributes below
Required:
    - name
    - policy_template
    - resource_type
Optional:
    - region
    - tags
EOT

  type = map(object({
    name            = string
    policy_template = string
    resource_type   = string
    region          = optional(string)
    tags            = optional(map(string))
  }))
}
