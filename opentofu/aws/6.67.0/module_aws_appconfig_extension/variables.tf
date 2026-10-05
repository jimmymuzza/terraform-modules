variable "appconfig_extensions" {
  description = <<EOT
Map of appconfig_extensions, attributes below
Required:
    - name
    - action_point
Optional:
    - description
    - region
    - tags
    - tags_all
    - parameter
EOT

  type = map(object({
    name         = string
    description  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    action_point = set(object({
            point  = string
            action = set(object({
                name        = string
                uri         = string
                description = optional(string)
                role_arn    = optional(string)
            }))
        }))
    parameter    = optional(set(object({
            name        = string
            description = optional(string)
            required    = optional(bool)
        })))
  }))
}
