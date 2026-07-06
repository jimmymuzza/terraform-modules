variable "ec2_traffic_mirror_filters" {
  description = <<EOT
Map of ec2_traffic_mirror_filters, attributes below
Optional:
    - description
    - network_services
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    description      = optional(string)
    network_services = optional(set(string))
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
