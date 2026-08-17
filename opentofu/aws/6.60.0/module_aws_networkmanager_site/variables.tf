variable "networkmanager_sites" {
  description = <<EOT
Map of networkmanager_sites, attributes below
Required:
    - global_network_id
Optional:
    - description
    - tags
    - tags_all
    - location
EOT

  type = map(object({
    global_network_id = string
    description       = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    location          = optional(list(object({
            address   = optional(string)
            latitude  = optional(string)
            longitude = optional(string)
        })))
  }))
}
