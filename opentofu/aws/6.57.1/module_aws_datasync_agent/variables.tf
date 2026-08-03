variable "datasync_agents" {
  description = <<EOT
Map of datasync_agents, attributes below
Optional:
    - activation_key
    - ip_address
    - name
    - private_link_endpoint
    - region
    - security_group_arns
    - subnet_arns
    - tags
    - tags_all
    - vpc_endpoint_id
EOT

  type = map(object({
    activation_key        = optional(string)
    ip_address            = optional(string)
    name                  = optional(string)
    private_link_endpoint = optional(string)
    region                = optional(string)
    security_group_arns   = optional(set(string))
    subnet_arns           = optional(set(string))
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    vpc_endpoint_id       = optional(string)
  }))
}
