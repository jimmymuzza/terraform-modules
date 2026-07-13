variable "dx_connection_associations" {
  description = <<EOT
Map of dx_connection_associations, attributes below
Required:
    - connection_id
    - lag_id
Optional:
    - region
EOT

  type = map(object({
    connection_id = string
    lag_id        = string
    region        = optional(string)
  }))
}
