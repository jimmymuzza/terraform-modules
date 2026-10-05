variable "appsync_functions" {
  description = <<EOT
Map of appsync_functions, attributes below
Required:
    - api_id
    - data_source
    - name
Optional:
    - code
    - description
    - function_version
    - max_batch_size
    - region
    - request_mapping_template
    - response_mapping_template
    - runtime
    - sync_config
EOT

  type = map(object({
    api_id                    = string
    data_source               = string
    name                      = string
    code                      = optional(string)
    description               = optional(string)
    function_version          = optional(string)
    max_batch_size            = optional(number)
    region                    = optional(string)
    request_mapping_template  = optional(string)
    response_mapping_template = optional(string)
    runtime                   = optional(list(object({
            name            = string
            runtime_version = string
        })))
    sync_config               = optional(list(object({
            conflict_detection             = optional(string)
            conflict_handler               = optional(string)
            lambda_conflict_handler_config = optional(list(object({
                lambda_conflict_handler_arn = optional(string)
            })))
        })))
  }))
}
