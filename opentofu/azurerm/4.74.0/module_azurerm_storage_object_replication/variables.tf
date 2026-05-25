variable "storage_object_replications" {
  description = <<EOT
Map of storage_object_replications, attributes below
Required:
    - destination_storage_account_id
    - source_storage_account_id
    - rules
EOT

  type = map(object({
    destination_storage_account_id = string
    source_storage_account_id      = string
    rules                          = set(object({
            destination_container_name   = string
            source_container_name        = string
            copy_blobs_created_after     = optional(string)
            filter_out_blobs_with_prefix = optional(set(string))
        }))
  }))
}
