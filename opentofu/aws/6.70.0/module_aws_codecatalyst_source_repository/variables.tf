variable "codecatalyst_source_repositories" {
  description = <<EOT
Map of codecatalyst_source_repositories, attributes below
Required:
    - name
    - project_name
    - space_name
Optional:
    - description
    - region
EOT

  type = map(object({
    name         = string
    project_name = string
    space_name   = string
    description  = optional(string)
    region       = optional(string)
  }))
}
