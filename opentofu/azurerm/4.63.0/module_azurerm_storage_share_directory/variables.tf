variable "storage_share_directories" {
  description = <<EOT
Map of storage_share_directories, attributes below
Required:
    - name
Optional:
    - metadata
    - storage_share_id
    - storage_share_url
EOT

  type = map(object({
    name              = string
    metadata          = optional(map(string))
    storage_share_id  = optional(string)
    storage_share_url = optional(string)
  }))
}
