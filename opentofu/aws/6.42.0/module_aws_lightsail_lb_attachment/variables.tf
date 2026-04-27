variable "lightsail_lb_attachments" {
  description = <<EOT
Map of lightsail_lb_attachments, attributes below
Required:
    - instance_name
    - lb_name
Optional:
    - region
EOT

  type = map(object({
    instance_name = string
    lb_name       = string
    region        = optional(string)
  }))
}
