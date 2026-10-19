variable "cloudwatch_log_delivery_destinations" {
  description = <<EOT
Map of cloudwatch_log_delivery_destinations, attributes below
Required:
    - name
Optional:
    - delivery_destination_type
    - output_format
    - region
    - tags
    - delivery_destination_configuration
EOT

  type = map(object({
    name                               = string
    delivery_destination_type          = optional(string)
    output_format                      = optional(string)
    region                             = optional(string)
    tags                               = optional(map(string))
    delivery_destination_configuration = optional(list(object({
            destination_resource_arn = optional(string)
        })))
  }))
}
