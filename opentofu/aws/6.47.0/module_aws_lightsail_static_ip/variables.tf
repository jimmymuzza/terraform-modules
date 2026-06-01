variable "lightsail_static_ips" {
  description = <<EOT
Map of lightsail_static_ips, attributes below
Required:
    - name
Optional:
    - region
EOT

  type = map(object({
    name   = string
    region = optional(string)
  }))
}
