variable "lightsail_bucket_access_keys" {
  description = <<EOT
Map of lightsail_bucket_access_keys, attributes below
Required:
    - bucket_name
Optional:
    - region
EOT

  type = map(object({
    bucket_name = string
    region      = optional(string)
  }))
}
