variable "cloudwatchomni_access_profiles" {
  description = <<EOT
Map of cloudwatchomni_access_profiles, attributes below
Required:
    - name
    - space_id
Optional:
    - description
    - region
EOT

  type = map(object({
    name        = string
    space_id    = string
    description = optional(string)
    region      = optional(string)
  }))
}
