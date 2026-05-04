variable "auditmanager_controls" {
  description = <<EOT
Map of auditmanager_controls, attributes below
Required:
    - name
Optional:
    - action_plan_instructions
    - action_plan_title
    - description
    - region
    - tags
    - testing_information
    - control_mapping_sources
EOT

  type = map(object({
    name                     = string
    action_plan_instructions = optional(string)
    action_plan_title        = optional(string)
    description              = optional(string)
    region                   = optional(string)
    tags                     = optional(map(string))
    testing_information      = optional(string)
    control_mapping_sources  = optional(set(object({
            source_name          = string
            source_set_up_option = string
            source_type          = string
            source_description   = optional(string)
            source_frequency     = optional(string)
            source_keyword       = optional(list(object({
                keyword_input_type = string
                keyword_value = string
            })))
            troubleshooting_text = optional(string)
        })))
  }))
}
