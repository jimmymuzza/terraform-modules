variable "cloudfront_functions" {
  description = <<EOT
Map of cloudfront_functions, attributes below
Required:
    - code
    - name
    - runtime
Optional:
    - comment
    - key_value_store_associations
    - publish
    - tags
    - tags_all
EOT

  type = map(object({
    code                         = string
    name                         = string
    runtime                      = string
    comment                      = optional(string)
    key_value_store_associations = optional(set(string))
    publish                      = optional(bool)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
  }))
}
