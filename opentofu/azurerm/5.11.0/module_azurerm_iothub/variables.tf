variable "iothubs" {
  description = <<EOT
Map of iothubs, attributes below
Required:
    - location
    - name
    - resource_group_name
    - sku
Optional:
    - endpoint
    - enrichment
    - event_hub_partition_count
    - event_hub_retention_in_days
    - local_authentication_enabled
    - min_tls_version
    - public_network_access_enabled
    - route
    - tags
    - cloud_to_device
    - fallback_route
    - file_upload
    - identity
    - network_rule_set
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    endpoint                      = optional(list(object({
            authentication_type = string
            batch_frequency_in_seconds = number
            connection_string = string
            container_name = string
            encoding = string
            endpoint_uri = string
            entity_path = string
            file_name_format = string
            identity_id = string
            max_chunk_size_in_bytes = number
            name = string
            resource_group_name = string
            subscription_id = string
            type = string
        })))
    enrichment                    = optional(list(object({
            endpoint_names = list(string)
            key = string
            value = string
        })))
    event_hub_partition_count     = optional(number)
    event_hub_retention_in_days   = optional(number)
    local_authentication_enabled  = optional(bool)
    min_tls_version               = optional(string)
    public_network_access_enabled = optional(bool)
    route                         = optional(list(object({
            condition = string
            enabled = bool
            endpoint_names = list(string)
            name = string
            source = string
        })))
    tags                          = optional(map(string))
    cloud_to_device               = optional(list(object({
            default_ttl        = optional(string)
            max_delivery_count = optional(number)
            feedback           = optional(list(object({
                lock_duration      = optional(string)
                max_delivery_count = optional(number)
                time_to_live       = optional(string)
            })))
        })))
    fallback_route                = optional(list(object({
            condition      = optional(string)
            enabled        = optional(bool)
            endpoint_names = optional(list(string))
            source         = optional(string)
        })))
    file_upload                   = optional(list(object({
            connection_string   = string
            container_name      = string
            authentication_type = optional(string)
            default_ttl         = optional(string)
            identity_id         = optional(string)
            lock_duration       = optional(string)
            max_delivery_count  = optional(number)
            notifications       = optional(bool)
            sas_ttl             = optional(string)
        })))
    identity                      = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    network_rule_set              = optional(list(object({
            apply_to_builtin_eventhub_endpoint = optional(bool)
            default_action                     = optional(string)
            ip_rule                            = optional(list(object({
                ip_mask = string
                name    = string
                action  = optional(string)
            })))
        })))
    sku                           = list(object({
            capacity = number
            name     = string
        }))
  }))
}
