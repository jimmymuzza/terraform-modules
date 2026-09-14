variable "dx_lags" {
  description = <<EOT
Map of dx_lags, attributes below
Required:
    - connections_bandwidth
    - location
    - name
Optional:
    - connection_id
    - force_destroy
    - provider_name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    connections_bandwidth = string
    location              = string
    name                  = string
    connection_id         = optional(string)
    force_destroy         = optional(bool)
    provider_name         = optional(string)
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
  }))
}
