variable "cloudwatch_log_streams" {
  description = <<EOT
Map of cloudwatch_log_streams, attributes below
Required:
    - log_group_name
    - name
Optional:
    - region
EOT

  type = map(object({
    log_group_name = string
    name           = string
    region         = optional(string)
  }))
}
