variable "lightsail_disks" {
  description = <<EOT
Map of lightsail_disks, attributes below
Required:
    - availability_zone
    - name
    - size_in_gb
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    availability_zone = string
    name              = string
    size_in_gb        = number
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
