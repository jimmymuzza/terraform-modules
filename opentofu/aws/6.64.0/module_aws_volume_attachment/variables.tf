variable "volume_attachments" {
  description = <<EOT
Map of volume_attachments, attributes below
Required:
    - device_name
    - instance_id
    - volume_id
Optional:
    - force_detach
    - region
    - skip_destroy
    - stop_instance_before_detaching
EOT

  type = map(object({
    device_name                    = string
    instance_id                    = string
    volume_id                      = string
    force_detach                   = optional(bool)
    region                         = optional(string)
    skip_destroy                   = optional(bool)
    stop_instance_before_detaching = optional(bool)
  }))
}
