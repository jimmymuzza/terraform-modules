variable "finspace_kx_users" {
  description = <<EOT
Map of finspace_kx_users, attributes below
Required:
    - environment_id
    - iam_role
    - name
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    environment_id = string
    iam_role       = string
    name           = string
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
  }))
}
