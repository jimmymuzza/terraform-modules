variable "data_protection_resource_guards" {
  description = <<EOT
Map of data_protection_resource_guards, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - vault_critical_operation_exclusion_list
EOT

  type = map(object({
    location                                = string
    name                                    = string
    resource_group_name                     = string
    tags                                    = optional(map(string))
    vault_critical_operation_exclusion_list = optional(list(string))
  }))
}
