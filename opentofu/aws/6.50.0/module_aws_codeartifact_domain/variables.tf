variable "codeartifact_domains" {
  description = <<EOT
Map of codeartifact_domains, attributes below
Required:
    - domain
Optional:
    - encryption_key
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    domain         = string
    encryption_key = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
  }))
}
