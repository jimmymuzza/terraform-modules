variable "codecatalyst_projects" {
  description = <<EOT
Map of codecatalyst_projects, attributes below
Required:
    - display_name
    - space_name
Optional:
    - description
    - region
EOT

  type = map(object({
    display_name = string
    space_name   = string
    description  = optional(string)
    region       = optional(string)
  }))
}
