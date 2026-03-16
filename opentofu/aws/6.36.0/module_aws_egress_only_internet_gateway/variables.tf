variable "egress_only_internet_gateways" {
  description = <<EOT
Map of egress_only_internet_gateways, attributes below
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
