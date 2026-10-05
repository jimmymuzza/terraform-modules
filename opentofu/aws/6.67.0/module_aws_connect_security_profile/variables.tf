variable "connect_security_profiles" {
  description = <<EOT
Map of connect_security_profiles, attributes below
Required:
    - instance_id
    - name
Optional:
    - description
    - permissions
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    instance_id = string
    name        = string
    description = optional(string)
    permissions = optional(set(string))
    region      = optional(string)
    tags        = optional(map(string))
    tags_all    = optional(map(string))
  }))
}
