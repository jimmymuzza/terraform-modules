variable "kendra_faqs" {
  description = <<EOT
Map of kendra_faqs, attributes below
Required:
    - index_id
    - name
    - role_arn
    - s3_path
Optional:
    - description
    - file_format
    - language_code
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    index_id      = string
    name          = string
    role_arn      = string
    description   = optional(string)
    file_format   = optional(string)
    language_code = optional(string)
    region        = optional(string)
    tags          = optional(map(string))
    tags_all      = optional(map(string))
    s3_path       = list(object({
            bucket = string
            key    = string
        }))
  }))
}
