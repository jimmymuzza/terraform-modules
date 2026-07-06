variable "sagemaker_model_card_export_jobs" {
  description = <<EOT
Map of sagemaker_model_card_export_jobs, attributes below
Required:
    - model_card_export_job_name
    - model_card_name
Optional:
    - model_card_version
    - region
    - output_config
EOT

  type = map(object({
    model_card_export_job_name = string
    model_card_name            = string
    model_card_version         = optional(number)
    region                     = optional(string)
    output_config              = optional(list(object({
            s3_output_path = string
        })))
  }))
}
