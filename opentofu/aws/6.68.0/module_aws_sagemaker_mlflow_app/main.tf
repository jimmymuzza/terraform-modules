resource "aws_sagemaker_mlflow_app" "sagemaker_mlflow_apps" {
  for_each = var.sagemaker_mlflow_apps

  artifact_store_uri              = each.value.artifact_store_uri
  name                            = each.value.name
  role_arn                        = each.value.role_arn
  account_default_status          = each.value.account_default_status
  default_domain_id_list          = each.value.default_domain_id_list
  model_registration_mode         = each.value.model_registration_mode
  region                          = each.value.region
  tags                            = each.value.tags
  weekly_maintenance_window_start = each.value.weekly_maintenance_window_start
}
