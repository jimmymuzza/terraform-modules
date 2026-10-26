variable "cloudwatchomni_access_grants" {
  description = <<EOT
Map of cloudwatchomni_access_grants, attributes below
Required:
    - domain_id
    - name
    - permission
    - space_id
Optional:
    - region
    - tags
    - principal
    - scoped_action
EOT

  type = map(object({
    domain_id     = string
    name          = string
    permission    = string
    space_id      = string
    region        = optional(string)
    tags          = optional(map(string))
    principal     = optional(list(object({
            principal_type      = string
            principal_id        = optional(string)
            principal_attribute = optional(list(object({
                key   = string
                value = string
            })))
        })))
    scoped_action = optional(list(object({
            actions  = list(string)
            resource = optional(list(object({
                resource_type   = string
                resource_arns   = optional(list(string))
                signal_types    = optional(list(string))
                tags            = optional(map(string))
                row_scope_group = optional(list(object({
                    row_scope = optional(list(object({
                        field    = string
                        operator = string
                        values   = set(string)
                    })))
                })))
            })))
        })))
  }))
}
