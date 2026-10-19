variable "directory_service_ip_routes" {
  description = <<EOT
Map of directory_service_ip_routes, attributes below
Required:
    - directory_id
Optional:
    - cidr_ip
    - cidr_ipv6
    - description
    - region
    - update_security_group_for_directory_controllers
EOT

  type = map(object({
    directory_id                                    = string
    cidr_ip                                         = optional(string)
    cidr_ipv6                                       = optional(string)
    description                                     = optional(string)
    region                                          = optional(string)
    update_security_group_for_directory_controllers = optional(bool)
  }))
}
