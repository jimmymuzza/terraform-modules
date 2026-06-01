variable "virtual_desktop_applications" {
  description = <<EOT
Map of virtual_desktop_applications, attributes below
Required:
    - application_group_id
    - command_line_argument_policy
    - name
    - path
Optional:
    - command_line_arguments
    - description
    - friendly_name
    - icon_index
    - icon_path
    - show_in_portal
EOT

  type = map(object({
    application_group_id         = string
    command_line_argument_policy = string
    name                         = string
    path                         = string
    command_line_arguments       = optional(string)
    description                  = optional(string)
    friendly_name                = optional(string)
    icon_index                   = optional(number)
    icon_path                    = optional(string)
    show_in_portal               = optional(bool)
  }))
}
