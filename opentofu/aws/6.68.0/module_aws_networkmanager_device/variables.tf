variable "networkmanager_devices" {
  description = <<EOT
Map of networkmanager_devices, attributes below
Required:
    - global_network_id
Optional:
    - description
    - model
    - serial_number
    - site_id
    - tags
    - tags_all
    - type
    - vendor
    - aws_location
    - location
EOT

  type = map(object({
    global_network_id = string
    description       = optional(string)
    model             = optional(string)
    serial_number     = optional(string)
    site_id           = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    type              = optional(string)
    vendor            = optional(string)
    aws_location      = optional(list(object({
            subnet_arn = optional(string)
            zone       = optional(string)
        })))
    location          = optional(list(object({
            address   = optional(string)
            latitude  = optional(string)
            longitude = optional(string)
        })))
  }))
}
