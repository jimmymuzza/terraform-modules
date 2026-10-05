variable "vpc_security_group_vpc_associations" {
  description = <<EOT
Map of vpc_security_group_vpc_associations, attributes below
Required:
    - security_group_id
    - vpc_id
Optional:
    - region
EOT

  type = map(object({
    security_group_id = string
    vpc_id            = string
    region            = optional(string)
  }))
}
