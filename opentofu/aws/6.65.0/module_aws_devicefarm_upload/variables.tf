variable "devicefarm_uploads" {
  description = <<EOT
Map of devicefarm_uploads, attributes below
Required:
    - name
    - project_arn
    - type
Optional:
    - content_type
    - region
EOT

  type = map(object({
    name         = string
    project_arn  = string
    type         = string
    content_type = optional(string)
    region       = optional(string)
  }))
}
