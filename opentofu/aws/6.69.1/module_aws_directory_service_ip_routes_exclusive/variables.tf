variable "directory_service_ip_routes_exclusives" {
  description = <<EOT
Map of directory_service_ip_routes_exclusives, attributes below
Required:
    - directory_id
Optional:
    - region
    - update_security_group_for_directory_controllers
    - ip_route
EOT

  type = map(object({
    directory_id                                    = string
    region                                          = optional(string)
    update_security_group_for_directory_controllers = optional(bool)
    ip_route                                        = optional(set(object({
            cidr_ip     = optional(string)
            cidr_ipv6   = optional(string)
            description = optional(string)
        })))
  }))
}
