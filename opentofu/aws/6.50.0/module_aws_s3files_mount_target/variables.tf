variable "s3files_mount_targets" {
  description = <<EOT
Map of s3files_mount_targets, attributes below
Required:
    - file_system_id
    - subnet_id
Optional:
    - ip_address_type
    - ipv4_address
    - ipv6_address
    - region
    - security_groups
EOT

  type = map(object({
    file_system_id  = string
    subnet_id       = string
    ip_address_type = optional(string)
    ipv4_address    = optional(string)
    ipv6_address    = optional(string)
    region          = optional(string)
    security_groups = optional(set(string))
  }))
}
