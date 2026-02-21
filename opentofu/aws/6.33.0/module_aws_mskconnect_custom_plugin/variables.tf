variable "mskconnect_custom_plugins" {
  description = <<EOT
Map of mskconnect_custom_plugins, attributes below
Required:
    - content_type
    - name
    - location
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    content_type = string
    name         = string
    description  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
    location     = list(object({
            s3 = list(object({
                bucket_arn     = string
                file_key       = string
                object_version = optional(string)
            }))
        }))
  }))
}
