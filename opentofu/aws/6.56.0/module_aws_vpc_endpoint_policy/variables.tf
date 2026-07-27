variable "vpc_endpoint_policies" {
  description = <<EOT
Map of vpc_endpoint_policies, attributes below
Required:
    - vpc_endpoint_id
Optional:
    - policy
    - region
EOT

  type = map(object({
    vpc_endpoint_id = string
    policy          = optional(string)
    region          = optional(string)
  }))
}
