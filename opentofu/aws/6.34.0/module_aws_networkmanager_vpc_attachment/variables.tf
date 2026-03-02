variable "networkmanager_vpc_attachments" {
  description = <<EOT
Map of networkmanager_vpc_attachments, attributes below
Required:
    - core_network_id
    - subnet_arns
    - vpc_arn
Optional:
    - routing_policy_label
    - tags
    - tags_all
    - options
EOT

  type = map(object({
    core_network_id      = string
    subnet_arns          = set(string)
    vpc_arn              = string
    routing_policy_label = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    options              = optional(list(object({
            appliance_mode_support             = optional(bool)
            dns_support                        = optional(bool)
            ipv6_support                       = optional(bool)
            security_group_referencing_support = optional(bool)
        })))
  }))
}
