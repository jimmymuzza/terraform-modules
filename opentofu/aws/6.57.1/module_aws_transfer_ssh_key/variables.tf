variable "transfer_ssh_keys" {
  description = <<EOT
Map of transfer_ssh_keys, attributes below
Required:
    - body
    - server_id
    - user_name
Optional:
    - region
EOT

  type = map(object({
    body      = string
    server_id = string
    user_name = string
    region    = optional(string)
  }))
}
