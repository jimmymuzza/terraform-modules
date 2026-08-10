variable "storage_share_files" {
  description = <<EOT
Map of storage_share_files, attributes below
Required:
    - name
    - storage_share_url
Optional:
    - content_disposition
    - content_encoding
    - content_md5
    - content_type
    - metadata
    - path
    - source
    - source_content
EOT

  type = map(object({
    name                = string
    storage_share_url   = string
    content_disposition = optional(string)
    content_encoding    = optional(string)
    content_md5         = optional(string)
    content_type        = optional(string)
    metadata            = optional(map(string))
    path                = optional(string)
    source              = optional(string)
    source_content      = optional(string)
  }))
}
