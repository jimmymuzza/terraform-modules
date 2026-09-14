variable "ssmcontacts_contacts" {
  description = <<EOT
Map of ssmcontacts_contacts, attributes below
Required:
    - alias
    - type
Optional:
    - display_name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    alias        = string
    type         = string
    display_name = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
