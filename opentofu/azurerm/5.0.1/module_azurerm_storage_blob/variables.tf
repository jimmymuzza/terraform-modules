variable "storage_blobs" {
  description = <<EOT
Map of storage_blobs, attributes below
Required:
    - name
    - storage_container_id
    - type
Optional:
    - access_tier
    - cache_control
    - content_md5
    - content_type
    - encryption_scope
    - metadata
    - parallelism
    - size
    - source
    - source_content
    - source_uri
EOT

  type = map(object({
    name                 = string
    storage_container_id = string
    type                 = string
    access_tier          = optional(string)
    cache_control        = optional(string)
    content_md5          = optional(string)
    content_type         = optional(string)
    encryption_scope     = optional(string)
    metadata             = optional(map(string))
    parallelism          = optional(number)
    size                 = optional(number)
    source               = optional(string)
    source_content       = optional(string)
    source_uri           = optional(string)
  }))
}
