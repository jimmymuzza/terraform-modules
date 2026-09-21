variable "cloudfront_vpc_origins" {
  description = <<EOT
Map of cloudfront_vpc_origins, attributes below
Optional:
    - tags
    - vpc_origin_endpoint_config
EOT

  type = map(object({
    tags                       = optional(map(string))
    vpc_origin_endpoint_config = optional(list(object({
            arn                    = string
            http_port              = number
            https_port             = number
            name                   = string
            origin_protocol_policy = string
            origin_ssl_protocols   = optional(list(object({
                items    = set(string)
                quantity = number
            })))
        })))
  }))
}
