variable "storage_queues" {
  description = <<EOT
Map of storage_queues, attributes below
Required:
    - name
    - storage_account_id
Optional:
    - metadata
EOT

  type = map(object({
    name               = string
    storage_account_id = string
    metadata           = optional(map(string))
  }))
}
