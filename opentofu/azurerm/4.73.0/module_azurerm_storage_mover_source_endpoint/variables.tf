variable "storage_mover_source_endpoints" {
  description = <<EOT
Map of storage_mover_source_endpoints, attributes below
Required:
    - host
    - name
    - storage_mover_id
Optional:
    - description
    - export
    - nfs_version
EOT

  type = map(object({
    host             = string
    name             = string
    storage_mover_id = string
    description      = optional(string)
    export           = optional(string)
    nfs_version      = optional(string)
  }))
}
