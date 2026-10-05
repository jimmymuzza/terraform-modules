variable "config_configuration_aggregators" {
  description = <<EOT
Map of config_configuration_aggregators, attributes below
Required:
    - name
Optional:
    - region
    - tags
    - tags_all
    - account_aggregation_source
    - organization_aggregation_source
EOT

  type = map(object({
    name                            = string
    region                          = optional(string)
    tags                            = optional(map(string))
    tags_all                        = optional(map(string))
    account_aggregation_source      = optional(list(object({
            account_ids = list(string)
            all_regions = optional(bool)
            regions     = optional(list(string))
        })))
    organization_aggregation_source = optional(list(object({
            role_arn    = string
            all_regions = optional(bool)
            regions     = optional(list(string))
        })))
  }))
}
