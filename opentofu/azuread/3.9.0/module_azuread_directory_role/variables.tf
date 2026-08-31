variable "directory_roles" {
  description = <<EOT
Map of directory_roles, attributes below
Optional:
    - display_name
    - template_id
EOT

  type = map(object({
    display_name = optional(string)
    template_id  = optional(string)
  }))
}
