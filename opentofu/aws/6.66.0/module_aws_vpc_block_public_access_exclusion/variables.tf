variable "vpc_block_public_access_exclusions" {
  description = <<EOT
Map of vpc_block_public_access_exclusions, attributes below
Required:
    - internet_gateway_exclusion_mode
Optional:
    - region
    - subnet_id
    - tags
    - vpc_id
EOT

  type = map(object({
    internet_gateway_exclusion_mode = string
    region                          = optional(string)
    subnet_id                       = optional(string)
    tags                            = optional(map(string))
    vpc_id                          = optional(string)
  }))
}
