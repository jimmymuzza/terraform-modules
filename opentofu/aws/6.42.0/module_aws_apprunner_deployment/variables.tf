variable "apprunner_deployments" {
  description = <<EOT
Map of apprunner_deployments, attributes below
Required:
    - service_arn
Optional:
    - region
EOT

  type = map(object({
    service_arn = string
    region      = optional(string)
  }))
}
