variable "iot_thing_principal_attachments" {
  description = <<EOT
Map of iot_thing_principal_attachments, attributes below
Required:
    - principal
    - thing
Optional:
    - region
    - thing_principal_type
EOT

  type = map(object({
    principal            = string
    thing                = string
    region               = optional(string)
    thing_principal_type = optional(string)
  }))
}
