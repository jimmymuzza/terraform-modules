variable "vpc_peering_connection_accepters" {
  description = <<EOT
Map of vpc_peering_connection_accepters, attributes below
Required:
    - vpc_peering_connection_id
Optional:
    - auto_accept
    - region
    - tags
    - tags_all
    - accepter
    - requester
EOT

  type = map(object({
    vpc_peering_connection_id = string
    auto_accept               = optional(bool)
    region                    = optional(string)
    tags                      = optional(map(string))
    tags_all                  = optional(map(string))
    accepter                  = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
    requester                 = optional(list(object({
            allow_remote_vpc_dns_resolution = optional(bool)
        })))
  }))
}
