variable "ec2_hosts" {
  description = <<EOT
Map of ec2_hosts, attributes below
Required:
    - availability_zone
Optional:
    - asset_id
    - auto_placement
    - host_recovery
    - instance_family
    - instance_type
    - outpost_arn
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    availability_zone = string
    asset_id          = optional(string)
    auto_placement    = optional(string)
    host_recovery     = optional(string)
    instance_family   = optional(string)
    instance_type     = optional(string)
    outpost_arn       = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
  }))
}
