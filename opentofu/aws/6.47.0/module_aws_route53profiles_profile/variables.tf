variable "route53profiles_profiles" {
  description = <<EOT
Map of route53profiles_profiles, attributes below
Required:
    - name
Optional:
    - region
    - tags
EOT

  type = map(object({
    name   = string
    region = optional(string)
    tags   = optional(map(string))
  }))
}
