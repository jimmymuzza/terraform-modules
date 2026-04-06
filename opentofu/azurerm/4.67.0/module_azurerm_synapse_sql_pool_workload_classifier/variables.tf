variable "synapse_sql_pool_workload_classifiers" {
  description = <<EOT
Map of synapse_sql_pool_workload_classifiers, attributes below
Required:
    - member_name
    - name
    - workload_group_id
Optional:
    - context
    - end_time
    - importance
    - label
    - start_time
EOT

  type = map(object({
    member_name       = string
    name              = string
    workload_group_id = string
    context           = optional(string)
    end_time          = optional(string)
    importance        = optional(string)
    label             = optional(string)
    start_time        = optional(string)
  }))
}
