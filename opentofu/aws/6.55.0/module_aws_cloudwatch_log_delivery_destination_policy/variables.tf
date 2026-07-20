variable "cloudwatch_log_delivery_destination_policies" {
  description = <<EOT
Map of cloudwatch_log_delivery_destination_policies, attributes below
Required:
    - delivery_destination_name
    - delivery_destination_policy
Optional:
    - region
EOT

  type = map(object({
    delivery_destination_name   = string
    delivery_destination_policy = string
    region                      = optional(string)
  }))
}
