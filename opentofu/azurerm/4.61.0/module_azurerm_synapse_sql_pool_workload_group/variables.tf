variable "synapse_sql_pool_workload_groups" {
  description = <<EOT
Map of synapse_sql_pool_workload_groups, attributes below
Required:
    - max_resource_percent
    - min_resource_percent
    - name
    - sql_pool_id
Optional:
    - importance
    - max_resource_percent_per_request
    - min_resource_percent_per_request
    - query_execution_timeout_in_seconds
EOT

  type = map(object({
    max_resource_percent               = number
    min_resource_percent               = number
    name                               = string
    sql_pool_id                        = string
    importance                         = optional(string)
    max_resource_percent_per_request   = optional(number)
    min_resource_percent_per_request   = optional(number)
    query_execution_timeout_in_seconds = optional(number)
  }))
}
