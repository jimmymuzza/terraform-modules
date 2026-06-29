variable "oam_links" {
  description = <<EOT
Map of oam_links, attributes below
Required:
    - label_template
    - resource_types
    - sink_identifier
Optional:
    - region
    - tags
    - tags_all
    - link_configuration
EOT

  type = map(object({
    label_template     = string
    resource_types     = set(string)
    sink_identifier    = string
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    link_configuration = optional(list(object({
            log_group_configuration = optional(list(object({
                filter = string
            })))
            metric_configuration    = optional(list(object({
                filter = string
            })))
        })))
  }))
}
