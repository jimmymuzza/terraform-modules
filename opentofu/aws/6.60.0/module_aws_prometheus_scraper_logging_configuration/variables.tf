variable "prometheus_scraper_logging_configurations" {
  description = <<EOT
Map of prometheus_scraper_logging_configurations, attributes below
Required:
    - scraper_id
Optional:
    - region
    - scraper_components
    - logging_destination
EOT

  type = map(object({
    scraper_id          = string
    region              = optional(string)
    scraper_components  = optional(set(string))
    logging_destination = optional(list(object({
            cloudwatch_logs = optional(list(object({
                log_group_arn = string
            })))
        })))
  }))
}
