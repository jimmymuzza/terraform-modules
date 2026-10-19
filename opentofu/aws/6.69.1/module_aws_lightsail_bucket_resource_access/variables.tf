variable "lightsail_bucket_resource_accesses" {
  description = <<EOT
Map of lightsail_bucket_resource_accesses, attributes below
Required:
    - bucket_name
    - resource_name
Optional:
    - region
EOT

  type = map(object({
    bucket_name   = string
    resource_name = string
    region        = optional(string)
  }))
}
