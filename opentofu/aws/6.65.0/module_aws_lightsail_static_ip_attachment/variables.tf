variable "lightsail_static_ip_attachments" {
  description = <<EOT
Map of lightsail_static_ip_attachments, attributes below
Required:
    - instance_name
    - static_ip_name
Optional:
    - region
EOT

  type = map(object({
    instance_name  = string
    static_ip_name = string
    region         = optional(string)
  }))
}
