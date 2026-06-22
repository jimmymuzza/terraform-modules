variable "storage_account_static_websites" {
  description = <<EOT
Map of storage_account_static_websites, attributes below
Required:
    - storage_account_id
Optional:
    - error_404_document
    - index_document
EOT

  type = map(object({
    storage_account_id = string
    error_404_document = optional(string)
    index_document     = optional(string)
  }))
}
