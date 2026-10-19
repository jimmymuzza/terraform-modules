variable "healthcare_fhir_services" {
  description = <<EOT
Map of healthcare_fhir_services, attributes below
Required:
    - location
    - name
    - resource_group_name
    - workspace_id
    - authentication
Optional:
    - access_policy_object_ids
    - configuration_export_storage_account_name
    - container_registry_login_server_url
    - kind
    - tags
    - cors
    - identity
    - oci_artifact
EOT

  type = map(object({
    location                                  = string
    name                                      = string
    resource_group_name                       = string
    workspace_id                              = string
    access_policy_object_ids                  = optional(set(string))
    configuration_export_storage_account_name = optional(string)
    container_registry_login_server_url       = optional(set(string))
    kind                                      = optional(string)
    tags                                      = optional(map(string))
    authentication                            = list(object({
            audience            = string
            authority           = string
            smart_proxy_enabled = optional(bool)
        }))
    cors                                      = optional(list(object({
            allowed_headers     = set(string)
            allowed_methods     = set(string)
            allowed_origins     = set(string)
            credentials_allowed = optional(bool)
            max_age_in_seconds  = optional(number)
        })))
    identity                                  = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    oci_artifact                              = optional(list(object({
            login_server = string
            digest       = optional(string)
            image_name   = optional(string)
        })))
  }))
}
