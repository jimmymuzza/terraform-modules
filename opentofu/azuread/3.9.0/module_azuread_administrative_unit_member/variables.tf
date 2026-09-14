variable "administrative_unit_members" {
  description = <<EOT
Map of administrative_unit_members, attributes below
Optional:
    - administrative_unit_object_id
    - member_object_id
EOT

  type = map(object({
    administrative_unit_object_id = optional(string)
    member_object_id              = optional(string)
  }))
}
