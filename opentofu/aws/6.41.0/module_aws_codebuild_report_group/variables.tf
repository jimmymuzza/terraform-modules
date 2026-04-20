variable "codebuild_report_groups" {
  description = <<EOT
Map of codebuild_report_groups, attributes below
Required:
    - name
    - type
    - export_config
Optional:
    - delete_reports
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    name           = string
    type           = string
    delete_reports = optional(bool)
    region         = optional(string)
    tags           = optional(map(string))
    tags_all       = optional(map(string))
    export_config  = list(object({
            type           = string
            s3_destination = optional(list(object({
                bucket              = string
                encryption_key      = string
                encryption_disabled = optional(bool)
                packaging           = optional(string)
                path                = optional(string)
            })))
        }))
  }))
}
