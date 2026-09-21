variable "lightsail_instances" {
  description = <<EOT
Map of lightsail_instances, attributes below
Required:
    - availability_zone
    - blueprint_id
    - bundle_id
    - name
Optional:
    - ip_address_type
    - key_pair_name
    - region
    - tags
    - tags_all
    - user_data
    - add_on
EOT

  type = map(object({
    availability_zone = string
    blueprint_id      = string
    bundle_id         = string
    name              = string
    ip_address_type   = optional(string)
    key_pair_name     = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    user_data         = optional(string)
    add_on            = optional(list(object({
            snapshot_time = string
            status        = string
            type          = string
        })))
  }))
}
