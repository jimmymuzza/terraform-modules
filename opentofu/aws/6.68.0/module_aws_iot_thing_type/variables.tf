variable "iot_thing_types" {
  description = <<EOT
Map of iot_thing_types, attributes below
Required:
    - name
Optional:
    - deprecated
    - region
    - tags
    - tags_all
    - properties
EOT

  type = map(object({
    name       = string
    deprecated = optional(bool)
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
    properties = optional(list(object({
            description           = optional(string)
            searchable_attributes = optional(set(string))
        })))
  }))
}
