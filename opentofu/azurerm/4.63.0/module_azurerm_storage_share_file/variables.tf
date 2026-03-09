variable "storage_share_files" {
  description = <<EOT
Map of storage_share_files, attributes below
Required:
    - name
Optional:
    - content_disposition
    - content_encoding
    - content_md5
    - content_type
    - metadata
    - path
    - source
    - storage_share_id
    - storage_share_url
EOT

  type = map(object({
    name                = string
    content_disposition = optional(string)
    content_encoding    = optional(string)
    content_md5         = optional(string)
    content_type        = optional(string)
    metadata            = optional(map(string))
    path                = optional(string)
    source              = optional(string)
    storage_share_id    = optional(string)
    storage_share_url   = optional(string)
  }))
}
