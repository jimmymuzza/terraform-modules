variable "cognitive_accounts" {
  description = <<EOT
Map of cognitive_accounts, attributes below
Required:
    - kind
    - location
    - name
    - resource_group_name
    - sku_name
Optional:
    - custom_question_answering_search_service_id
    - custom_question_answering_search_service_key
    - custom_subdomain_name
    - dynamic_throttling_enabled
    - fqdns
    - local_auth_enabled
    - metrics_advisor_aad_client_id
    - metrics_advisor_aad_tenant_id
    - metrics_advisor_super_user_name
    - metrics_advisor_website_name
    - outbound_network_access_restricted
    - project_management_enabled
    - public_network_access_enabled
    - qna_runtime_endpoint
    - tags
    - customer_managed_key
    - identity
    - network_acls
    - network_injection
    - storage
EOT

  type = map(object({
    kind                                         = string
    location                                     = string
    name                                         = string
    resource_group_name                          = string
    sku_name                                     = string
    custom_question_answering_search_service_id  = optional(string)
    custom_question_answering_search_service_key = optional(string)
    custom_subdomain_name                        = optional(string)
    dynamic_throttling_enabled                   = optional(bool)
    fqdns                                        = optional(list(string))
    local_auth_enabled                           = optional(bool)
    metrics_advisor_aad_client_id                = optional(string)
    metrics_advisor_aad_tenant_id                = optional(string)
    metrics_advisor_super_user_name              = optional(string)
    metrics_advisor_website_name                 = optional(string)
    outbound_network_access_restricted           = optional(bool)
    project_management_enabled                   = optional(bool)
    public_network_access_enabled                = optional(bool)
    qna_runtime_endpoint                         = optional(string)
    tags                                         = optional(map(string))
    customer_managed_key                         = optional(list(object({
            key_vault_key_id   = string
            identity_client_id = optional(string)
        })))
    identity                                     = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_acls                                 = optional(list(object({
            default_action        = string
            bypass                = optional(string)
            ip_rules              = optional(set(string))
            virtual_network_rules = optional(set(object({
                subnet_id                            = string
                ignore_missing_vnet_service_endpoint = optional(bool)
            })))
        })))
    network_injection                            = optional(list(object({
            scenario  = string
            subnet_id = string
        })))
    storage                                      = optional(list(object({
            storage_account_id = string
            identity_client_id = optional(string)
        })))
  }))
}
