variable "cognito_users" {
  description = <<EOT
Map of cognito_users, attributes below
Required:
    - user_pool_id
    - username
Optional:
    - attributes
    - client_metadata
    - desired_delivery_mediums
    - enabled
    - force_alias_creation
    - message_action
    - password
    - region
    - temporary_password
    - validation_data
EOT

  type = map(object({
    user_pool_id             = string
    username                 = string
    attributes               = optional(map(string))
    client_metadata          = optional(map(string))
    desired_delivery_mediums = optional(set(string))
    enabled                  = optional(bool)
    force_alias_creation     = optional(bool)
    message_action           = optional(string)
    password                 = optional(string)
    region                   = optional(string)
    temporary_password       = optional(string)
    validation_data          = optional(map(string))
  }))
}
