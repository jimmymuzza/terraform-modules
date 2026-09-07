variable "codecommit_repositories" {
  description = <<EOT
Map of codecommit_repositories, attributes below
Required:
    - repository_name
Optional:
    - default_branch
    - description
    - kms_key_id
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    repository_name = string
    default_branch  = optional(string)
    description     = optional(string)
    kms_key_id      = optional(string)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
  }))
}
