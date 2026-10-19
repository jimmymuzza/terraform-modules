variable "storage_share_directories" {
  description = <<EOT
Map of storage_share_directories, attributes below
Required:
    - name
    - storage_share_url
Optional:
    - metadata
EOT

  type = map(object({
    name              = string
    storage_share_url = string
    metadata          = optional(map(string))
  }))
}
