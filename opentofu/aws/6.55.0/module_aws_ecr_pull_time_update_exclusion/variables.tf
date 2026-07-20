variable "ecr_pull_time_update_exclusions" {
  description = <<EOT
Map of ecr_pull_time_update_exclusions, attributes below
Required:
    - principal_arn
Optional:
    - region
EOT

  type = map(object({
    principal_arn = string
    region        = optional(string)
  }))
}
