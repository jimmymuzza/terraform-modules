variable "codecommit_approval_rule_template_associations" {
  description = <<EOT
Map of codecommit_approval_rule_template_associations, attributes below
Required:
    - approval_rule_template_name
    - repository_name
Optional:
    - region
EOT

  type = map(object({
    approval_rule_template_name = string
    repository_name             = string
    region                      = optional(string)
  }))
}
