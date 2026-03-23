variable "transfer_web_app_customizations" {
  description = <<EOT
Map of transfer_web_app_customizations, attributes below
Required:
    - web_app_id
Optional:
    - favicon_file
    - logo_file
    - region
    - title
EOT

  type = map(object({
    web_app_id   = string
    favicon_file = optional(string)
    logo_file    = optional(string)
    region       = optional(string)
    title        = optional(string)
  }))
}
