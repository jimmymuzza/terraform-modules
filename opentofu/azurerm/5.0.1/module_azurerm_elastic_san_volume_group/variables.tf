variable "elastic_san_volume_groups" {
  description = <<EOT
Map of elastic_san_volume_groups, attributes below
Required:
    - elastic_san_id
    - name
Optional:
    - encryption_type
    - protocol_type
    - encryption
    - identity
    - network_rule
EOT

  type = map(object({
    elastic_san_id  = string
    name            = string
    encryption_type = optional(string)
    protocol_type   = optional(string)
    encryption      = optional(list(object({
            key_vault_key_id          = string
            user_assigned_identity_id = optional(string)
        })))
    identity        = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_rule    = optional(list(object({
            subnet_id = string
            action    = optional(string)
        })))
  }))
}
