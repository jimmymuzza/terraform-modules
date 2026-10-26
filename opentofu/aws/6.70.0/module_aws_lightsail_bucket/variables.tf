variable "lightsail_buckets" {
  description = <<EOT
Map of lightsail_buckets, attributes below
Required:
    - bundle_id
    - name
Optional:
    - force_delete
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    bundle_id    = string
    name         = string
    force_delete = optional(bool)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
