variable "sentinel_data_connector_aws_cloud_trails" {
  description = <<EOT
Map of sentinel_data_connector_aws_cloud_trails, attributes below
Required:
    - aws_role_arn
    - log_analytics_workspace_id
    - name
EOT

  type = map(object({
    aws_role_arn               = string
    log_analytics_workspace_id = string
    name                       = string
  }))
}
