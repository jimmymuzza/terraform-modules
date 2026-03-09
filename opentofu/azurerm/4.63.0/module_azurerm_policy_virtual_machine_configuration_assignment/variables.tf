variable "policy_virtual_machine_configuration_assignments" {
  description = <<EOT
Map of policy_virtual_machine_configuration_assignments, attributes below
Required:
    - location
    - name
    - virtual_machine_id
    - configuration
EOT

  type = map(object({
    location           = string
    name               = string
    virtual_machine_id = string
    configuration      = list(object({
            assignment_type = optional(string)
            content_hash    = optional(string)
            content_uri     = optional(string)
            version         = optional(string)
            parameter       = optional(set(object({
                name  = string
                value = string
            })))
        }))
  }))
}
