variable "codepipeline_webhooks" {
  description = <<EOT
Map of codepipeline_webhooks, attributes below
Required:
    - authentication
    - name
    - target_action
    - target_pipeline
    - filter
Optional:
    - region
    - tags
    - tags_all
    - authentication_configuration
EOT

  type = map(object({
    authentication               = string
    name                         = string
    target_action                = string
    target_pipeline              = string
    region                       = optional(string)
    tags                         = optional(map(string))
    tags_all                     = optional(map(string))
    authentication_configuration = optional(list(object({
            allowed_ip_range = optional(string)
            secret_token     = optional(string)
        })))
    filter                       = set(object({
            json_path    = string
            match_equals = string
        }))
  }))
}
