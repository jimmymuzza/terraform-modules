variable "kendra_query_suggestions_block_lists" {
  description = <<EOT
Map of kendra_query_suggestions_block_lists, attributes below
Required:
    - index_id
    - name
    - role_arn
    - source_s3_path
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    index_id       = string
    name           = string
    role_arn       = string
    description    = optional(string)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    source_s3_path = list(object({
            bucket = string
            key    = string
        }))
  }))
}
