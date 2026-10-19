variable "transfer_host_keys" {
  description = <<EOT
Map of transfer_host_keys, attributes below
Required:
    - server_id
Optional:
    - description
    - host_key_body
    - host_key_body_wo
    - region
    - tags
EOT

  type = map(object({
    server_id        = string
    description      = optional(string)
    host_key_body    = optional(string)
    host_key_body_wo = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
  }))
}
