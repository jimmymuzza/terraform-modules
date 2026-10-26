variable "ssoadmin_permission_sets" {
  description = <<EOT
Map of ssoadmin_permission_sets, attributes below
Required:
    - instance_arn
    - name
Optional:
    - description
    - region
    - relay_state
    - session_duration
    - tags
    - tags_all
EOT

  type = map(object({
    instance_arn     = string
    name             = string
    description      = optional(string)
    region           = optional(string)
    relay_state      = optional(string)
    session_duration = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
  }))
}
