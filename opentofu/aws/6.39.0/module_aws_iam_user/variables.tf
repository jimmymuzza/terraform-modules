variable "iam_users" {
  description = <<EOT
Map of iam_users, attributes below
Required:
    - name
Optional:
    - force_destroy
    - path
    - permissions_boundary
    - tags
    - tags_all
EOT

  type = map(object({
    name                 = string
    force_destroy        = optional(bool)
    path                 = optional(string)
    permissions_boundary = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
  }))
}
