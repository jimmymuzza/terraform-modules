variable "securityhub_finding_aggregators" {
  description = <<EOT
Map of securityhub_finding_aggregators, attributes below
Required:
    - linking_mode
Optional:
    - region
    - specified_regions
EOT

  type = map(object({
    linking_mode      = string
    region            = optional(string)
    specified_regions = optional(set(string))
  }))
}
