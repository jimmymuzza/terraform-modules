variable "elastic_beanstalk_application_versions" {
  description = <<EOT
Map of elastic_beanstalk_application_versions, attributes below
Required:
    - application
    - bucket
    - key
    - name
Optional:
    - description
    - force_delete
    - process
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    application  = string
    bucket       = string
    key          = string
    name         = string
    description  = optional(string)
    force_delete = optional(bool)
    process      = optional(bool)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
