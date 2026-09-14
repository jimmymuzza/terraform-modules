variable "ec2_default_credit_specifications" {
  description = <<EOT
Map of ec2_default_credit_specifications, attributes below
Required:
    - cpu_credits
    - instance_family
Optional:
    - region
EOT

  type = map(object({
    cpu_credits     = string
    instance_family = string
    region          = optional(string)
  }))
}
