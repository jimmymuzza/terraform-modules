variable "ip_group_cidrs" {
  description = <<EOT
Map of ip_group_cidrs, attributes below
Required:
    - cidr
    - ip_group_id
EOT

  type = map(object({
    cidr        = string
    ip_group_id = string
  }))
}
