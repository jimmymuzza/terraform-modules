variable "route53profiles_resource_associations" {
  description = <<EOT
Map of route53profiles_resource_associations, attributes below
Required:
    - name
    - profile_id
    - resource_arn
Optional:
    - region
    - resource_properties
EOT

  type = map(object({
    name                = string
    profile_id          = string
    resource_arn        = string
    region              = optional(string)
    resource_properties = optional(string)
  }))
}
