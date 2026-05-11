variable "route53_query_logs" {
  description = <<EOT
Map of route53_query_logs, attributes below
Required:
    - cloudwatch_log_group_arn
    - zone_id
EOT

  type = map(object({
    cloudwatch_log_group_arn = string
    zone_id                  = string
  }))
}
