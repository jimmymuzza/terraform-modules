variable "iot_thing_group_memberships" {
  description = <<EOT
Map of iot_thing_group_memberships, attributes below
Required:
    - thing_group_name
    - thing_name
Optional:
    - override_dynamic_group
    - region
EOT

  type = map(object({
    thing_group_name       = string
    thing_name             = string
    override_dynamic_group = optional(bool)
    region                 = optional(string)
  }))
}
