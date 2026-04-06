variable "imagebuilder_workflows" {
  description = <<EOT
Map of imagebuilder_workflows, attributes below
Required:
    - name
    - type
    - version
Optional:
    - change_description
    - data
    - description
    - kms_key_id
    - region
    - tags
    - tags_all
    - uri
EOT

  type = map(object({
    name               = string
    type               = string
    version            = string
    change_description = optional(string)
    data               = optional(string)
    description        = optional(string)
    kms_key_id         = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    uri                = optional(string)
  }))
}
