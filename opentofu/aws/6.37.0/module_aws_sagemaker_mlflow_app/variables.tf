variable "sagemaker_mlflow_apps" {
  description = <<EOT
Map of sagemaker_mlflow_apps, attributes below
Required:
    - artifact_store_uri
    - name
    - role_arn
Optional:
    - account_default_status
    - default_domain_id_list
    - model_registration_mode
    - region
    - tags
    - weekly_maintenance_window_start
EOT

  type = map(object({
    artifact_store_uri              = string
    name                            = string
    role_arn                        = string
    account_default_status          = optional(string)
    default_domain_id_list          = optional(set(string))
    model_registration_mode         = optional(string)
    region                          = optional(string)
    tags                            = optional(map(string))
    weekly_maintenance_window_start = optional(string)
  }))
}
