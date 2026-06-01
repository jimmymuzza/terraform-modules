variable "servicecatalog_tag_options" {
  description = <<EOT
Map of servicecatalog_tag_options, attributes below
Required:
    - key
    - value
Optional:
    - active
    - region
EOT

  type = map(object({
    key    = string
    value  = string
    active = optional(bool)
    region = optional(string)
  }))
}
