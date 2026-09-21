variable "prometheus_scrapers" {
  description = <<EOT
Map of prometheus_scrapers, attributes below
Required:
    - scrape_configuration
Optional:
    - alias
    - region
    - tags
    - destination
    - exporter
    - role_configuration
    - source
EOT

  type = map(object({
    scrape_configuration = string
    alias                = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    destination          = optional(list(object({
            amp        = optional(list(object({
                workspace_arn = string
            })))
            cloudwatch = optional(list(object({
                dataset_arn = string
            })))
        })))
    exporter             = optional(list(object({
            opensearch = optional(list(object({
                domain_arn = string
            })))
        })))
    role_configuration   = optional(list(object({
            source_role_arn = optional(string)
            target_role_arn = optional(string)
        })))
    source               = optional(list(object({
            eks = optional(list(object({
                cluster_arn        = string
                subnet_ids         = set(string)
                security_group_ids = optional(set(string))
            })))
            vpc = optional(list(object({
                security_group_ids = set(string)
                subnet_ids         = set(string)
            })))
        })))
  }))
}
