variable "dx_connection_confirmations" {
  description = <<EOT
Map of dx_connection_confirmations, attributes below
Required:
    - connection_id
Optional:
    - region
EOT

  type = map(object({
    connection_id = string
    region        = optional(string)
  }))
}
