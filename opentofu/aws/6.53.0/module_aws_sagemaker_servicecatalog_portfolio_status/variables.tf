variable "sagemaker_servicecatalog_portfolio_status" {
  description = <<EOT
Map of sagemaker_servicecatalog_portfolio_status, attributes below
Required:
    - status
Optional:
    - region
EOT

  type = map(object({
    status = string
    region = optional(string)
  }))
}
