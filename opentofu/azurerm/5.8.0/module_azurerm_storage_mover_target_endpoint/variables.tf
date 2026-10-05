variable "storage_mover_target_endpoints" {
  description = <<EOT
Map of storage_mover_target_endpoints, attributes below
Required:
    - name
    - storage_account_id
    - storage_container_name
    - storage_mover_id
Optional:
    - description
EOT

  type = map(object({
    name                   = string
    storage_account_id     = string
    storage_container_name = string
    storage_mover_id       = string
    description            = optional(string)
  }))
}
