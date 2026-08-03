variable "athena_prepared_statements" {
  description = <<EOT
Map of athena_prepared_statements, attributes below
Required:
    - name
    - query_statement
    - workgroup
Optional:
    - description
    - region
EOT

  type = map(object({
    name            = string
    query_statement = string
    workgroup       = string
    description     = optional(string)
    region          = optional(string)
  }))
}
