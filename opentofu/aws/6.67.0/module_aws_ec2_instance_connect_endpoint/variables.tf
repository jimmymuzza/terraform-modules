variable "ec2_instance_connect_endpoints" {
  description = <<EOT
Map of ec2_instance_connect_endpoints, attributes below
Required:
    - subnet_id
Optional:
    - ip_address_type
    - preserve_client_ip
    - region
    - security_group_ids
    - tags
EOT

  type = map(object({
    subnet_id          = string
    ip_address_type    = optional(string)
    preserve_client_ip = optional(bool)
    region             = optional(string)
    security_group_ids = optional(set(string))
    tags               = optional(map(string))
  }))
}
