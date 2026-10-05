variable "vpc_ipam_preview_next_cidrs" {
  description = <<EOT
Map of vpc_ipam_preview_next_cidrs, attributes below
Required:
    - ipam_pool_id
Optional:
    - disallowed_cidrs
    - netmask_length
    - region
EOT

  type = map(object({
    ipam_pool_id     = string
    disallowed_cidrs = optional(set(string))
    netmask_length   = optional(number)
    region           = optional(string)
  }))
}
