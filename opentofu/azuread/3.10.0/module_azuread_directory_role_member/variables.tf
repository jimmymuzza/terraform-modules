variable "directory_role_members" {
  description = <<EOT
Map of directory_role_members, attributes below
Optional:
    - member_object_id
    - role_object_id
EOT

  type = map(object({
    member_object_id = optional(string)
    role_object_id   = optional(string)
  }))
}
