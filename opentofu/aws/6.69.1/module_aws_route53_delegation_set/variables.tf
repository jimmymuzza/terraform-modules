variable "route53_delegation_sets" {
  description = <<EOT
Map of route53_delegation_sets, attributes below
Optional:
    - reference_name
EOT

  type = map(object({
    reference_name = optional(string)
  }))
}
