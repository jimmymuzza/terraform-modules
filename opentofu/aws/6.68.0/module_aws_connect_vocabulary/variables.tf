variable "connect_vocabularies" {
  description = <<EOT
Map of connect_vocabularies, attributes below
Required:
    - content
    - instance_id
    - language_code
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    content       = string
    instance_id   = string
    language_code = string
    name          = string
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
  }))
}
