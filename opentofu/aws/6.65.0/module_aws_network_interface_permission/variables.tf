variable "network_interface_permissions" {
  description = <<EOT
Map of network_interface_permissions, attributes below
Required:
    - aws_account_id
    - network_interface_id
    - permission
Optional:
    - region
EOT

  type = map(object({
    aws_account_id       = string
    network_interface_id = string
    permission           = string
    region               = optional(string)
  }))
}
