variable "redshiftdata_statements" {
  description = <<EOT
Map of redshiftdata_statements, attributes below
Required:
    - database
    - sql
Optional:
    - cluster_identifier
    - db_user
    - region
    - secret_arn
    - statement_name
    - with_event
    - workgroup_name
    - parameters
EOT

  type = map(object({
    database           = string
    sql                = string
    cluster_identifier = optional(string)
    db_user            = optional(string)
    region             = optional(string)
    secret_arn         = optional(string)
    statement_name     = optional(string)
    with_event         = optional(bool)
    workgroup_name     = optional(string)
    parameters         = optional(list(object({
            name  = string
            value = string
        })))
  }))
}
