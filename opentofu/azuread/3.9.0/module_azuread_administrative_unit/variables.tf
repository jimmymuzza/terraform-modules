variable "administrative_units" {
  description = <<EOT
Map of administrative_units, attributes below
Required:
    - display_name
Optional:
    - description
    - hidden_membership_enabled
    - members
    - prevent_duplicate_names
EOT

  type = map(object({
    display_name              = string
    description               = optional(string)
    hidden_membership_enabled = optional(bool)
    members                   = optional(set(string))
    prevent_duplicate_names   = optional(bool)
  }))
}
