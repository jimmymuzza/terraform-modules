variable "appsync_resolvers" {
  description = <<EOT
Map of appsync_resolvers, attributes below
Required:
    - api_id
    - field
    - type
Optional:
    - code
    - data_source
    - kind
    - max_batch_size
    - region
    - request_template
    - response_template
    - caching_config
    - pipeline_config
    - runtime
    - sync_config
EOT

  type = map(object({
    api_id            = string
    field             = string
    type              = string
    code              = optional(string)
    data_source       = optional(string)
    kind              = optional(string)
    max_batch_size    = optional(number)
    region            = optional(string)
    request_template  = optional(string)
    response_template = optional(string)
    caching_config    = optional(list(object({
            caching_keys = optional(set(string))
            ttl          = optional(number)
        })))
    pipeline_config   = optional(list(object({
            functions = optional(list(string))
        })))
    runtime           = optional(list(object({
            name            = string
            runtime_version = string
        })))
    sync_config       = optional(list(object({
            conflict_detection             = optional(string)
            conflict_handler               = optional(string)
            lambda_conflict_handler_config = optional(list(object({
                lambda_conflict_handler_arn = optional(string)
            })))
        })))
  }))
}
