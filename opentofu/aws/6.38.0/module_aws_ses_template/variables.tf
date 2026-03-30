variable "ses_templates" {
  description = <<EOT
Map of ses_templates, attributes below
Required:
    - name
Optional:
    - html
    - region
    - subject
    - text
EOT

  type = map(object({
    name    = string
    html    = optional(string)
    region  = optional(string)
    subject = optional(string)
    text    = optional(string)
  }))
}
