variable "blueprint_assignments" {
  description = <<EOT
Map of blueprint_assignments, attributes below
Required:
    - location
    - name
    - target_subscription_id
    - version_id
    - identity
Optional:
    - lock_exclude_actions
    - lock_exclude_principals
    - lock_mode
    - parameter_values
    - resource_groups
EOT

  type = map(object({
    location                = string
    name                    = string
    target_subscription_id  = string
    version_id              = string
    lock_exclude_actions    = optional(list(string))
    lock_exclude_principals = optional(list(string))
    lock_mode               = optional(string)
    parameter_values        = optional(string)
    resource_groups         = optional(string)
    identity                = list(object({
            type         = string
            identity_ids = optional(set(string))
        }))
  }))
}
