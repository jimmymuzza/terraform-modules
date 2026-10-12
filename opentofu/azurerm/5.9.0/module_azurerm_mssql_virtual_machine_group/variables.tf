variable "mssql_virtual_machine_groups" {
  description = <<EOT
Map of mssql_virtual_machine_groups, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sql_image_offer
    - sql_image_sku
    - wsfc_domain_profile
Optional:
    - tags
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    sql_image_offer     = string
    sql_image_sku       = string
    tags                = optional(map(string))
    wsfc_domain_profile = list(object({
            cluster_subnet_type            = string
            fqdn                           = string
            cluster_bootstrap_account_name = optional(string)
            cluster_operator_account_name  = optional(string)
            organizational_unit_path       = optional(string)
            sql_service_account_name       = optional(string)
            storage_account_primary_key    = optional(string)
            storage_account_url            = optional(string)
        }))
  }))
}
