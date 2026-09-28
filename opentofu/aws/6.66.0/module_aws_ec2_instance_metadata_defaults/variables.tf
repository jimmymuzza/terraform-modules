variable "ec2_instance_metadata_defaults" {
  description = <<EOT
Map of ec2_instance_metadata_defaults, attributes below
Optional:
    - http_endpoint
    - http_put_response_hop_limit
    - http_tokens
    - instance_metadata_tags
    - region
EOT

  type = map(object({
    http_endpoint               = optional(string)
    http_put_response_hop_limit = optional(number)
    http_tokens                 = optional(string)
    instance_metadata_tags      = optional(string)
    region                      = optional(string)
  }))
}
