resource "aws_sagemaker_mlflow_tracking_server" "sagemaker_mlflow_tracking_servers" {
  for_each = var.sagemaker_mlflow_tracking_servers

  artifact_store_uri              = each.value.artifact_store_uri
  role_arn                        = each.value.role_arn
  tracking_server_name            = each.value.tracking_server_name
  automatic_model_registration    = each.value.automatic_model_registration
  mlflow_version                  = each.value.mlflow_version
  region                          = each.value.region
  tags                            = each.value.tags
  tags_all                        = each.value.tags_all
  tracking_server_size            = each.value.tracking_server_size
  weekly_maintenance_window_start = each.value.weekly_maintenance_window_start
}
