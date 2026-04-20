variable "dev_test_policies" {
  description = <<EOT
Map of dev_test_policies, attributes below
Required:
    - evaluator_type
    - lab_name
    - name
    - policy_set_name
    - resource_group_name
    - threshold
Optional:
    - description
    - fact_data
    - tags
EOT

  type = map(object({
    evaluator_type      = string
    lab_name            = string
    name                = string
    policy_set_name     = string
    resource_group_name = string
    threshold           = string
    description         = optional(string)
    fact_data           = optional(string)
    tags                = optional(map(string))
  }))
}
