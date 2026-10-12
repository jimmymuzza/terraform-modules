variable "sagemaker_mlflow_tracking_servers" {
  description = <<EOT
Map of sagemaker_mlflow_tracking_servers, attributes below
Required:
    - artifact_store_uri
    - role_arn
    - tracking_server_name
Optional:
    - automatic_model_registration
    - mlflow_version
    - region
    - tags
    - tags_all
    - tracking_server_size
    - weekly_maintenance_window_start
EOT

  type = map(object({
    artifact_store_uri              = string
    role_arn                        = string
    tracking_server_name            = string
    automatic_model_registration    = optional(bool)
    mlflow_version                  = optional(string)
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    tracking_server_size            = optional(string)
    weekly_maintenance_window_start = optional(string)
  }))
}
