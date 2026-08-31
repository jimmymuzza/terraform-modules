variable "lightsail_disk_attachments" {
  description = <<EOT
Map of lightsail_disk_attachments, attributes below
Required:
    - disk_name
    - disk_path
    - instance_name
Optional:
    - region
EOT

  type = map(object({
    disk_name     = string
    disk_path     = string
    instance_name = string
    region        = optional(string)
  }))
}
