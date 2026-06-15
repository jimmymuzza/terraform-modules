variable "ssm_patch_baselines" {
  description = <<EOT
Map of ssm_patch_baselines, attributes below
Required:
    - name
Optional:
    - approved_patches
    - approved_patches_compliance_level
    - approved_patches_enable_non_security
    - available_security_updates_compliance_status
    - description
    - operating_system
    - region
    - rejected_patches
    - rejected_patches_action
    - tags
    - tags_all
    - approval_rule
    - global_filter
    - source
EOT

  type = map(object({
    name                                         = string
    approved_patches                             = optional(set(string))
    approved_patches_compliance_level            = optional(string)
    approved_patches_enable_non_security         = optional(bool)
    available_security_updates_compliance_status = optional(string)
    description                                  = optional(string)
    operating_system                             = optional(string)
    region                                       = optional(string)
    rejected_patches                             = optional(set(string))
    rejected_patches_action                      = optional(string)
    tags                                         = optional(map(string))
    tags_all                                     = optional(map(string))
    approval_rule                                = optional(list(object({
            approve_after_days  = optional(number)
            approve_until_date  = optional(string)
            compliance_level    = optional(string)
            enable_non_security = optional(bool)
            patch_filter        = list(object({
                key    = string
                values = list(string)
            }))
        })))
    global_filter                                = optional(list(object({
            key    = string
            values = list(string)
        })))
    source                                       = optional(list(object({
            configuration = string
            name          = string
            products      = list(string)
        })))
  }))
}
