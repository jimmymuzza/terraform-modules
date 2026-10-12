variable "efs_mount_targets" {
  description = <<EOT
Map of efs_mount_targets, attributes below
Required:
    - file_system_id
    - subnet_id
Optional:
    - ip_address
    - ip_address_type
    - ipv6_address
    - region
    - security_groups
EOT

  type = map(object({
    file_system_id  = string
    subnet_id       = string
    ip_address      = optional(string)
    ip_address_type = optional(string)
    ipv6_address    = optional(string)
    region          = optional(string)
    security_groups = optional(set(string))
  }))
}
