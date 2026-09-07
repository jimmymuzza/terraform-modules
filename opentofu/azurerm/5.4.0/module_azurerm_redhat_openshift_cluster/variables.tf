variable "redhat_openshift_clusters" {
  description = <<EOT
Map of redhat_openshift_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - api_server_profile
    - cluster_profile
    - ingress_profile
    - main_profile
    - network_profile
    - worker_profile
Optional:
    - tags
    - identity
    - platform_workload_identity_profile
    - service_principal
EOT

  type = map(object({
    location                           = string
    name                               = string
    resource_group_name                = string
    tags                               = optional(map(string))
    api_server_profile                 = list(object({
            visibility = string
        }))
    cluster_profile                    = list(object({
            domain                      = string
            version                     = string
            fips_enabled                = optional(bool)
            managed_resource_group_name = optional(string)
            pull_secret                 = optional(string)
        }))
    identity                           = optional(list(object({
            identity_ids = set(string)
            type         = string
        })))
    ingress_profile                    = list(object({
            visibility = string
        }))
    main_profile                       = list(object({
            subnet_id                  = string
            vm_size                    = string
            disk_encryption_set_id     = optional(string)
            encryption_at_host_enabled = optional(bool)
        }))
    network_profile                    = list(object({
            pod_cidr                                     = string
            service_cidr                                 = string
            outbound_type                                = optional(string)
            preconfigured_network_security_group_enabled = optional(bool)
            load_balancer_profile                        = optional(list(object({
                managed_outbound_ip_count = number
            })))
        }))
    platform_workload_identity_profile = optional(list(object({
            upgradeable_to             = optional(string)
            platform_workload_identity = set(object({
                identity_id = string
                name        = string
            }))
        })))
    service_principal                  = optional(list(object({
            client_id     = string
            client_secret = string
        })))
    worker_profile                     = list(object({
            disk_size_gb               = number
            node_count                 = number
            subnet_id                  = string
            vm_size                    = string
            disk_encryption_set_id     = optional(string)
            encryption_at_host_enabled = optional(bool)
        }))
  }))
}
