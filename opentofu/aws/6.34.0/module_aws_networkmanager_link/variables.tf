variable "networkmanager_links" {
  description = <<EOT
Map of networkmanager_links, attributes below
Required:
    - global_network_id
    - site_id
    - bandwidth
Optional:
    - description
    - provider_name
    - tags
    - tags_all
    - type
EOT

  type = map(object({
    global_network_id = string
    site_id           = string
    description       = optional(string)
    provider_name     = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    type              = optional(string)
    bandwidth         = list(object({
            download_speed = optional(number)
            upload_speed   = optional(number)
        }))
  }))
}
