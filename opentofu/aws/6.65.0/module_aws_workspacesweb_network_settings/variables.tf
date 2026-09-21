variable "workspacesweb_network_settings" {
  description = <<EOT
Map of workspacesweb_network_settings, attributes below
Required:
    - security_group_ids
    - subnet_ids
    - vpc_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    security_group_ids = set(string)
    subnet_ids         = set(string)
    vpc_id             = string
    region             = optional(string)
    tags               = optional(map(string))
  }))
}
