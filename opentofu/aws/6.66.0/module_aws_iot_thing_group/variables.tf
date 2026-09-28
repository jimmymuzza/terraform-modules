variable "iot_thing_groups" {
  description = <<EOT
Map of iot_thing_groups, attributes below
Required:
    - name
Optional:
    - parent_group_name
    - region
    - tags
    - tags_all
    - properties
EOT

  type = map(object({
    name              = string
    parent_group_name = optional(string)
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    properties        = optional(list(object({
            description       = optional(string)
            attribute_payload = optional(list(object({
                attributes = optional(map(string))
            })))
        })))
  }))
}
