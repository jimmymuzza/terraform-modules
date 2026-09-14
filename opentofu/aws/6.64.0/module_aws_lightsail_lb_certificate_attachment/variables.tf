variable "lightsail_lb_certificate_attachments" {
  description = <<EOT
Map of lightsail_lb_certificate_attachments, attributes below
Required:
    - certificate_name
    - lb_name
Optional:
    - region
EOT

  type = map(object({
    certificate_name = string
    lb_name          = string
    region           = optional(string)
  }))
}
