variable "lightsail_key_pairs" {
  description = <<EOT
Map of lightsail_key_pairs, attributes below
Optional:
    - name
    - name_prefix
    - pgp_key
    - public_key
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name        = optional(string)
    name_prefix = optional(string)
    pgp_key     = optional(string)
    public_key  = optional(string)
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
