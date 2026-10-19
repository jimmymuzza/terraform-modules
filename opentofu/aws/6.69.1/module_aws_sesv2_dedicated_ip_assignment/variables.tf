variable "sesv2_dedicated_ip_assignments" {
  description = <<EOT
Map of sesv2_dedicated_ip_assignments, attributes below
Required:
    - destination_pool_name
    - ip
Optional:
    - region
EOT

  type = map(object({
    destination_pool_name = string
    ip                    = string
    region                = optional(string)
  }))
}
