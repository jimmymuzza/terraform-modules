variable "inspector_assessment_targets" {
  description = <<EOT
Map of inspector_assessment_targets, attributes below
Required:
    - name
Optional:
    - region
    - resource_group_arn
EOT

  type = map(object({
    name               = string
    region             = optional(string)
    resource_group_arn = optional(string)
  }))
}
