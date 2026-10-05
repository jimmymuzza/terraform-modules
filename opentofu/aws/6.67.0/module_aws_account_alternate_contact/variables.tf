variable "account_alternate_contacts" {
  description = <<EOT
Map of account_alternate_contacts, attributes below
Required:
    - alternate_contact_type
    - email_address
    - name
    - phone_number
    - title
Optional:
    - account_id
EOT

  type = map(object({
    alternate_contact_type = string
    email_address          = string
    name                   = string
    phone_number           = string
    title                  = string
    account_id             = optional(string)
  }))
}
