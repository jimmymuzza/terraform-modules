variable "vpc_peering_connection_options" {
  description = <<EOT
Map of vpc_peering_connection_options, attributes below
Required:
    - vpc_peering_connection_id
Optional:
    - region
    - accepter
    - requester
EOT

  type = map(object({
    vpc_peering_connection_id = string
    region                    = optional(string)
    accepter                  = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
    requester                 = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
  }))
}
