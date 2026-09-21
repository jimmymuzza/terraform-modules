variable "shared_image_galleries" {
  description = <<EOT
Map of shared_image_galleries, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - tags
    - sharing
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    tags                = optional(map(string))
    sharing             = optional(list(object({
            permission        = string
            community_gallery = optional(list(object({
                eula            = string
                prefix          = string
                publisher_email = string
                publisher_uri   = string
            })))
        })))
  }))
}
