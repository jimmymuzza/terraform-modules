variable "application_owners" {
  description = <<EOT
Map of application_owners, attributes below
Required:
    - application_id
    - owner_object_id
EOT

  type = map(object({
    application_id  = string
    owner_object_id = string
  }))
}
