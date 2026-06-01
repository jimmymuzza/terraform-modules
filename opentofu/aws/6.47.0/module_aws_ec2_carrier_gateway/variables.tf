variable "ec2_carrier_gateways" {
  description = <<EOT
Map of ec2_carrier_gateways, attributes below
Required:
    - vpc_id
Optional:
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    vpc_id   = string
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
  }))
}
