variable "frontdoors" {
  description = <<EOT
Map of frontdoors, attributes below
Required:
    - name
    - resource_group_name
    - backend_pool
    - backend_pool_health_probe
    - backend_pool_load_balancing
    - frontend_endpoint
    - routing_rule
Optional:
    - friendly_name
    - load_balancer_enabled
    - tags
    - backend_pool_settings
EOT

  type = map(object({
    name                        = string
    resource_group_name         = string
    friendly_name               = optional(string)
    load_balancer_enabled       = optional(bool)
    tags                        = optional(map(string))
    backend_pool                = list(object({
            health_probe_name   = string
            load_balancing_name = string
            name                = string
            backend             = list(object({
                address     = string
                host_header = string
                http_port   = number
                https_port  = number
                enabled     = optional(bool)
                priority    = optional(number)
                weight      = optional(number)
            }))
        }))
    backend_pool_health_probe   = list(object({
            name                = string
            enabled             = optional(bool)
            interval_in_seconds = optional(number)
            path                = optional(string)
            probe_method        = optional(string)
            protocol            = optional(string)
        }))
    backend_pool_load_balancing = list(object({
            name                            = string
            additional_latency_milliseconds = optional(number)
            sample_size                     = optional(number)
            successful_samples_required     = optional(number)
        }))
    backend_pool_settings       = optional(list(object({
            enforce_backend_pools_certificate_name_check = bool
            backend_pools_send_receive_timeout_seconds   = optional(number)
        })))
    frontend_endpoint           = list(object({
            host_name                               = string
            name                                    = string
            session_affinity_enabled                = optional(bool)
            session_affinity_ttl_seconds            = optional(number)
            web_application_firewall_policy_link_id = optional(string)
        }))
    routing_rule                = list(object({
            accepted_protocols       = list(string)
            frontend_endpoints       = list(string)
            name                     = string
            patterns_to_match        = list(string)
            enabled                  = optional(bool)
            forwarding_configuration = optional(list(object({
                backend_pool_name                     = string
                cache_duration                        = optional(string)
                cache_enabled                         = optional(bool)
                cache_query_parameter_strip_directive = optional(string)
                cache_query_parameters                = optional(list(string))
                cache_use_dynamic_compression         = optional(bool)
                custom_forwarding_path                = optional(string)
                forwarding_protocol                   = optional(string)
            })))
            redirect_configuration   = optional(list(object({
                redirect_protocol   = string
                redirect_type       = string
                custom_fragment     = optional(string)
                custom_host         = optional(string)
                custom_path         = optional(string)
                custom_query_string = optional(string)
            })))
        }))
  }))
}
