variable "stream_analytics_clusters" {
  description = <<EOT
Map of stream_analytics_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - streaming_capacity
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    streaming_capacity  = number
    tags                = optional(map(string))
  }))
}
