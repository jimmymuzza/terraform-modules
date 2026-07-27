variable "sentinel_data_connector_aws_s3s" {
  description = <<EOT
Map of sentinel_data_connector_aws_s3s, attributes below
Required:
    - aws_role_arn
    - destination_table
    - log_analytics_workspace_id
    - name
    - sqs_urls
EOT

  type = map(object({
    aws_role_arn               = string
    destination_table          = string
    log_analytics_workspace_id = string
    name                       = string
    sqs_urls                   = list(string)
  }))
}
