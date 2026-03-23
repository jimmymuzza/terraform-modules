variable "cloudwatch_log_destination_policies" {
  description = <<EOT
Map of cloudwatch_log_destination_policies, attributes below
Required:
    - access_policy
    - destination_name
Optional:
    - force_update
    - region
EOT

  type = map(object({
    access_policy    = string
    destination_name = string
    force_update     = optional(bool)
    region           = optional(string)
  }))
}
