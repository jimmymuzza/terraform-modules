variable "opensearchserverless_collections" {
  description = <<EOT
Map of opensearchserverless_collections, attributes below
Required:
    - name
Optional:
    - collection_group_name
    - description
    - encryption_config
    - region
    - standby_replicas
    - tags
    - type
EOT

  type = map(object({
    name                  = string
    collection_group_name = optional(string)
    description           = optional(string)
    encryption_config     = optional(list(object({
            aws_owned_key = bool
            kms_key_arn = string
        })))
    region                = optional(string)
    standby_replicas      = optional(string)
    tags                  = optional(map(string))
    type                  = optional(string)
  }))
}
