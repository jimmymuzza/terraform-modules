variable "lightsail_lbs" {
  description = <<EOT
Map of lightsail_lbs, attributes below
Required:
    - instance_port
    - name
Optional:
    - health_check_path
    - ip_address_type
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_port     = number
    name              = string
    health_check_path = optional(string)
    ip_address_type   = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
