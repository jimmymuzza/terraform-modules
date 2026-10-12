variable "transcribe_language_models" {
  description = <<EOT
Map of transcribe_language_models, attributes below
Required:
    - base_model_name
    - language_code
    - model_name
    - input_data_config
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    base_model_name   = string
    language_code     = string
    model_name        = string
    region            = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    input_data_config = list(object({
            data_access_role_arn = string
            s3_uri               = string
            tuning_data_s3_uri   = optional(string)
        }))
  }))
}
