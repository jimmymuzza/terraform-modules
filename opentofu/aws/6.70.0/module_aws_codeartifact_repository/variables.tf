variable "codeartifact_repositories" {
  description = <<EOT
Map of codeartifact_repositories, attributes below
Required:
    - domain
    - repository
Optional:
    - description
    - domain_owner
    - region
    - tags
    - tags_all
    - external_connections
    - upstream
EOT

  type = map(object({
    domain               = string
    repository           = string
    description          = optional(string)
    domain_owner         = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    external_connections = optional(list(object({
            external_connection_name = string
        })))
    upstream             = optional(list(object({
            repository_name = string
        })))
  }))
}
