variable "s3control_buckets" {
  description = <<EOT
Map of s3control_buckets, attributes below
Required:
    - bucket
    - outpost_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    bucket     = string
    outpost_id = string
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
  }))
}
