variable "vpc_block_public_access_options" {
  description = <<EOT
Map of vpc_block_public_access_options, attributes below
Required:
    - internet_gateway_block_mode
Optional:
    - region
EOT

  type = map(object({
    internet_gateway_block_mode = string
    region                      = optional(string)
  }))
}
