variable "cloudwatch_query_definitions" {
  description = <<EOT
Map of cloudwatch_query_definitions, attributes below
Required:
    - name
    - query_string
Optional:
    - log_group_names
    - region
EOT

  type = map(object({
    name            = string
    query_string    = string
    log_group_names = optional(list(string))
    region          = optional(string)
  }))
}
