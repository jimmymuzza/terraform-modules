variable "directory_role_eligibility_schedule_requests" {
  description = <<EOT
Map of directory_role_eligibility_schedule_requests, attributes below
Required:
    - directory_scope_id
    - justification
    - principal_id
    - role_definition_id
EOT

  type = map(object({
    directory_scope_id = string
    justification      = string
    principal_id       = string
    role_definition_id = string
  }))
}
