variable "vpc_ipam_pool_cidrs" {
  description = <<EOT
Map of vpc_ipam_pool_cidrs, attributes below
Required:
    - ipam_pool_id
Optional:
    - cidr
    - netmask_length
    - region
    - cidr_authorization_context
EOT

  type = map(object({
    ipam_pool_id               = string
    cidr                       = optional(string)
    netmask_length             = optional(number)
    region                     = optional(string)
    cidr_authorization_context = optional(list(object({
            message   = optional(string)
            signature = optional(string)
        })))
  }))
}
