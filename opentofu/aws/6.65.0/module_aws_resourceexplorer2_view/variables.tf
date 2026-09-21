variable "resourceexplorer2_views" {
  description = <<EOT
Map of resourceexplorer2_views, attributes below
Required:
    - name
Optional:
    - default_view
    - region
    - scope
    - tags
    - filters
    - included_property
EOT

  type = map(object({
    name              = string
    default_view      = optional(bool)
    region            = optional(string)
    scope             = optional(string)
    tags              = optional(map(string))
    filters           = optional(list(object({
            filter_string = string
        })))
    included_property = optional(list(object({
            name = string
        })))
  }))
}
