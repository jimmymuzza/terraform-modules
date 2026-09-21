variable "securityhub_connector_v2s" {
  description = <<EOT
Map of securityhub_connector_v2s, attributes below
Required:
    - name
Optional:
    - description
    - kms_key_arn
    - region
    - tags
    - connector_provider
EOT

  type = map(object({
    name               = string
    description        = optional(string)
    kms_key_arn        = optional(string)
    region             = optional(string)
    tags               = optional(map(string))
    connector_provider = optional(list(object({
            jira_cloud  = optional(list(object({
                project_key = string
            })))
            service_now = optional(list(object({
                instance_name = string
                secret_arn    = string
            })))
        })))
  }))
}
