variable "codecommit_approval_rule_templates" {
  description = <<EOT
Map of codecommit_approval_rule_templates, attributes below
Required:
    - content
    - name
Optional:
    - description
    - region
EOT

  type = map(object({
    content     = string
    name        = string
    description = optional(string)
    region      = optional(string)
  }))
}
