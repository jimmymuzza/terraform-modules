variable "elastic_beanstalk_applications" {
  description = <<EOT
Map of elastic_beanstalk_applications, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - tags_all
    - appversion_lifecycle
EOT

  type = map(object({
    name                 = string
    description          = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    appversion_lifecycle = optional(list(object({
            service_role          = string
            delete_source_from_s3 = optional(bool)
            max_age_in_days       = optional(number)
            max_count             = optional(number)
        })))
  }))
}
