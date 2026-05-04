variable "ecrpublic_repositories" {
  description = <<EOT
Map of ecrpublic_repositories, attributes below
Required:
    - repository_name
Optional:
    - force_destroy
    - region
    - tags
    - tags_all
    - catalog_data
EOT

  type = map(object({
    repository_name = string
    force_destroy   = optional(bool)
    region          = optional(string)
    tags            = optional(map(string))
    tags_all        = optional(map(string))
    catalog_data    = optional(list(object({
            about_text        = optional(string)
            architectures     = optional(set(string))
            description       = optional(string)
            logo_image_blob   = optional(string)
            operating_systems = optional(set(string))
            usage_text        = optional(string)
        })))
  }))
}
