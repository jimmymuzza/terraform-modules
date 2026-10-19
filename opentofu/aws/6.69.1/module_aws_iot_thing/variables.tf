variable "iot_things" {
  description = <<EOT
Map of iot_things, attributes below
Required:
    - name
Optional:
    - attributes
    - region
    - thing_type_name
EOT

  type = map(object({
    name            = string
    attributes      = optional(map(string))
    region          = optional(string)
    thing_type_name = optional(string)
  }))
}
