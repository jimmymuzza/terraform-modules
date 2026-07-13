variable "securityhub_aggregator_v2s" {
  description = <<EOT
Map of securityhub_aggregator_v2s, attributes below
Required:
    - region_linking_mode
Optional:
    - linked_regions
    - region
    - tags
EOT

  type = map(object({
    region_linking_mode = string
    linked_regions      = optional(set(string))
    region              = optional(string)
    tags                = optional(map(string))
  }))
}
