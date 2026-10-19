variable "data_factory_customer_managed_keys" {
  description = <<EOT
Map of data_factory_customer_managed_keys, attributes below
Required:
    - customer_managed_key_id
    - data_factory_id
Optional:
    - user_assigned_identity_id
EOT

  type = map(object({
    customer_managed_key_id   = string
    data_factory_id           = string
    user_assigned_identity_id = optional(string)
  }))
}
