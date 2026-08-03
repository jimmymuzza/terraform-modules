variable "cloudfrontkeyvaluestore_keys_exclusives" {
  description = <<EOT
Map of cloudfrontkeyvaluestore_keys_exclusives, attributes below
Required:
    - key_value_store_arn
Optional:
    - max_batch_size
    - resource_key_value_pair
EOT

  type = map(object({
    key_value_store_arn     = string
    max_batch_size          = optional(number)
    resource_key_value_pair = optional(set(object({
            key   = string
            value = string
        })))
  }))
}
