variable "maps_creators" {
  description = <<EOT
Map of maps_creators, attributes below
Required:
    - location
    - maps_account_id
    - name
    - storage_units
Optional:
    - tags
EOT

  type = map(object({
    location        = string
    maps_account_id = string
    name            = string
    storage_units   = number
    tags            = optional(map(string))
  }))
}
