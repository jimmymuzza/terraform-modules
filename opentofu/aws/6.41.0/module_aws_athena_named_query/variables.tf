variable "athena_named_queries" {
  description = <<EOT
Map of athena_named_queries, attributes below
Required:
    - database
    - name
    - query
Optional:
    - description
    - region
    - workgroup
EOT

  type = map(object({
    database    = string
    name        = string
    query       = string
    description = optional(string)
    region      = optional(string)
    workgroup   = optional(string)
  }))
}
