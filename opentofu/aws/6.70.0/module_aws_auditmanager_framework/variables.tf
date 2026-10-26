variable "auditmanager_frameworks" {
  description = <<EOT
Map of auditmanager_frameworks, attributes below
Required:
    - name
Optional:
    - compliance_type
    - description
    - region
    - tags
    - control_sets
EOT

  type = map(object({
    name            = string
    compliance_type = optional(string)
    description     = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    control_sets    = optional(set(object({
            name     = string
            controls = optional(set(object({

            })))
        })))
  }))
}
