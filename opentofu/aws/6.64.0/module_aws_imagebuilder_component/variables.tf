variable "imagebuilder_components" {
  description = <<EOT
Map of imagebuilder_components, attributes below
Required:
    - name
    - platform
    - version
Optional:
    - change_description
    - data
    - description
    - kms_key_id
    - region
    - skip_destroy
    - supported_os_versions
    - tags
    - tags_all
    - uri
EOT

  type = map(object({
    name                  = string
    platform              = string
    version               = string
    change_description    = optional(string)
    data                  = optional(string)
    description           = optional(string)
    kms_key_id            = optional(string)
    region                = optional(string)
    skip_destroy          = optional(bool)
    supported_os_versions = optional(set(string))
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    uri                   = optional(string)
  }))
}
