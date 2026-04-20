variable "vpc_ipam_pool_cidr_allocations" {
  description = <<EOT
Map of vpc_ipam_pool_cidr_allocations, attributes below
Required:
    - ipam_pool_id
Optional:
    - cidr
    - description
    - disallowed_cidrs
    - netmask_length
    - region
EOT

  type = map(object({
    ipam_pool_id     = string
    cidr             = optional(string)
    description      = optional(string)
    disallowed_cidrs = optional(set(string))
    netmask_length   = optional(number)
    region           = optional(string)
  }))
}
