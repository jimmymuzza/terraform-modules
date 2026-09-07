variable "auditmanager_assessment_reports" {
  description = <<EOT
Map of auditmanager_assessment_reports, attributes below
Required:
    - assessment_id
    - name
Optional:
    - description
    - region
EOT

  type = map(object({
    assessment_id = string
    name          = string
    description   = optional(string)
    region        = optional(string)
  }))
}
