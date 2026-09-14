variable "ssm_documents" {
  description = <<EOT
Map of ssm_documents, attributes below
Required:
    - content
    - document_type
    - name
Optional:
    - document_format
    - permissions
    - region
    - tags
    - tags_all
    - target_type
    - version_name
    - attachments_source
EOT

  type = map(object({
    content            = string
    document_type      = string
    name               = string
    document_format    = optional(string)
    permissions        = optional(map(string))
    region             = optional(string)
    tags               = optional(map(string))
    tags_all           = optional(map(string))
    target_type        = optional(string)
    version_name       = optional(string)
    attachments_source = optional(list(object({
            key    = string
            values = list(string)
            name   = optional(string)
        })))
  }))
}
