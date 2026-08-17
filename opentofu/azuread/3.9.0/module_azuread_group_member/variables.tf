variable "group_members" {
  description = <<EOT
Map of group_members, attributes below
Required:
    - group_object_id
    - member_object_id
EOT

  type = map(object({
    group_object_id  = string
    member_object_id = string
  }))
}
