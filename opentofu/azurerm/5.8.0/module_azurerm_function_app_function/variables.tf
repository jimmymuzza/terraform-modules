variable "function_app_functions" {
  description = <<EOT
Map of function_app_functions, attributes below
Required:
    - config_json
    - function_app_id
    - name
Optional:
    - enabled
    - language
    - test_data
    - file
EOT

  type = map(object({
    config_json     = string
    function_app_id = string
    name            = string
    enabled         = optional(bool)
    language        = optional(string)
    test_data       = optional(string)
    file            = optional(list(object({
            content = string
            name    = string
        })))
  }))
}
