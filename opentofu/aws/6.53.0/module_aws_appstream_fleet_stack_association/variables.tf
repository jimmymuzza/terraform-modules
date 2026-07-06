variable "appstream_fleet_stack_associations" {
  description = <<EOT
Map of appstream_fleet_stack_associations, attributes below
Required:
    - fleet_name
    - stack_name
Optional:
    - region
EOT

  type = map(object({
    fleet_name = string
    stack_name = string
    region     = optional(string)
  }))
}
