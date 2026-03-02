variable "datazone_projects" {
  description = <<EOT
Map of datazone_projects, attributes below
Required:
    - domain_identifier
    - name
Optional:
    - description
    - glossary_terms
    - region
    - skip_deletion_check
EOT

  type = map(object({
    domain_identifier   = string
    name                = string
    description         = optional(string)
    glossary_terms      = optional(list(string))
    region              = optional(string)
    skip_deletion_check = optional(bool)
  }))
}
