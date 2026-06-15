variable "auditmanager_assessments" {
  description = <<EOT
Map of auditmanager_assessments, attributes below
Required:
    - framework_id
    - name
Optional:
    - description
    - region
    - tags
    - assessment_reports_destination
    - roles
    - scope
EOT

  type = map(object({
    framework_id                   = string
    name                           = string
    description                    = optional(string)
    region                         = optional(string)
    tags                           = optional(map(string))
    assessment_reports_destination = optional(list(object({
            destination      = string
            destination_type = string
        })))
    roles                          = optional(set(object({
            role_arn  = string
            role_type = string
        })))
    scope                          = optional(list(object({
            aws_accounts = optional(set(object({

            })))
            aws_services = optional(set(object({
                service_name = string
            })))
        })))
  }))
}
