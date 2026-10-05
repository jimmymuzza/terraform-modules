variable "connect_phone_numbers" {
  description = <<EOT
Map of connect_phone_numbers, attributes below
Required:
    - country_code
    - target_arn
    - type
Optional:
    - description
    - prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    country_code = string
    target_arn   = string
    type         = string
    description  = optional(string)
    prefix       = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
