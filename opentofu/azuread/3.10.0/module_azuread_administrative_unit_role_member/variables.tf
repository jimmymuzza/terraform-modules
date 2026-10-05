variable "administrative_unit_role_members" {
  description = <<EOT
Map of administrative_unit_role_members, attributes below
Required:
    - administrative_unit_object_id
    - member_object_id
    - role_object_id
EOT

  type = map(object({
    administrative_unit_object_id = string
    member_object_id              = string
    role_object_id                = string
  }))
}
