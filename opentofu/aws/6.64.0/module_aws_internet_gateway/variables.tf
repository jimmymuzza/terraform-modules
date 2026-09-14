variable "internet_gateways" {
  description = <<EOT
Map of internet_gateways, attributes below
Optional:
    - region
    - tags
    - tags_all
    - vpc_id
EOT

  type = map(object({
    region   = optional(string)
    tags     = optional(map(string))
    tags_all = optional(map(string))
    vpc_id   = optional(string)
  }))
}
