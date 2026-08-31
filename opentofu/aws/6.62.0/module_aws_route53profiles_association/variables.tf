variable "route53profiles_associations" {
  description = <<EOT
Map of route53profiles_associations, attributes below
Required:
    - name
    - profile_id
    - resource_id
Optional:
    - region
    - tags
EOT

  type = map(object({
    name        = string
    profile_id  = string
    resource_id = string
    region      = optional(string)
    tags        = optional(map(string))
  }))
}
