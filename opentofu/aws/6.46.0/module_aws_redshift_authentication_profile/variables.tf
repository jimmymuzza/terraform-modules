variable "redshift_authentication_profiles" {
  description = <<EOT
Map of redshift_authentication_profiles, attributes below
Required:
    - authentication_profile_content
    - authentication_profile_name
Optional:
    - region
EOT

  type = map(object({
    authentication_profile_content = string
    authentication_profile_name    = string
    region                         = optional(string)
  }))
}
