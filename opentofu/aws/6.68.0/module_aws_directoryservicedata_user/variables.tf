variable "directoryservicedata_users" {
  description = <<EOT
Map of directoryservicedata_users, attributes below
Required:
    - directory_id
    - sam_account_name
Optional:
    - email_address
    - given_name
    - region
    - surname
EOT

  type = map(object({
    directory_id     = string
    sam_account_name = string
    email_address    = optional(string)
    given_name       = optional(string)
    region           = optional(string)
    surname          = optional(string)
  }))
}
