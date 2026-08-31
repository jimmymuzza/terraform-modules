variable "shield_proactive_engagements" {
  description = <<EOT
Map of shield_proactive_engagements, attributes below
Required:
    - enabled
Optional:
    - emergency_contact
EOT

  type = map(object({
    enabled           = bool
    emergency_contact = optional(list(object({
            email_address = string
            contact_notes = optional(string)
            phone_number  = optional(string)
        })))
  }))
}
