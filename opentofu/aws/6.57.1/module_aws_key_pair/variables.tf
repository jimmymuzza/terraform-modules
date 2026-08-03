variable "key_pairs" {
  description = <<EOT
Map of key_pairs, attributes below
Required:
    - public_key
Optional:
    - key_name
    - key_name_prefix
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    public_key      = string
    key_name        = optional(string)
    key_name_prefix = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
