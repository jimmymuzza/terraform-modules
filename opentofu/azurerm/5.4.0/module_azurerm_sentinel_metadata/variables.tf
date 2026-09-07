variable "sentinel_metadatas" {
  description = <<EOT
Map of sentinel_metadatas, attributes below
Required:
    - content_id
    - kind
    - name
    - parent_id
    - workspace_id
Optional:
    - content_schema_version
    - custom_version
    - dependency
    - first_publish_date
    - icon_id
    - last_publish_date
    - preview_images
    - preview_images_dark
    - providers
    - threat_analysis_tactics
    - threat_analysis_techniques
    - version
    - author
    - category
    - source
    - support
EOT

  type = map(object({
    content_id                 = string
    kind                       = string
    name                       = string
    parent_id                  = string
    workspace_id               = string
    content_schema_version     = optional(string)
    custom_version             = optional(string)
    dependency                 = optional(string)
    first_publish_date         = optional(string)
    icon_id                    = optional(string)
    last_publish_date          = optional(string)
    preview_images             = optional(list(string))
    preview_images_dark        = optional(list(string))
    providers                  = optional(list(string))
    threat_analysis_tactics    = optional(list(string))
    threat_analysis_techniques = optional(list(string))
    version                    = optional(string)
    author                     = optional(list(object({
            email = optional(string)
            link  = optional(string)
            name  = optional(string)
        })))
    category                   = optional(list(object({
            domains   = optional(list(string))
            verticals = optional(list(string))
        })))
    source                     = optional(list(object({
            kind = string
            name = optional(string)
        })))
    support                    = optional(list(object({
            tier  = string
            email = optional(string)
            link  = optional(string)
            name  = optional(string)
        })))
  }))
}
