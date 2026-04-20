variable "storage_queues" {
  description = <<EOT
Map of storage_queues, attributes below
Required:
    - name
Optional:
    - metadata
    - storage_account_id
    - storage_account_name
EOT

  type = map(object({
    name                 = string
    metadata             = optional(map(string))
    storage_account_id   = optional(string)
    storage_account_name = optional(string)
  }))
}
