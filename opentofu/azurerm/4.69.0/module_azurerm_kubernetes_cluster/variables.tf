variable "kubernetes_clusters" {
  description = <<EOT
Map of kubernetes_clusters, attributes below
Required:
    - location
    - name
    - resource_group_name
    - default_node_pool
Optional:
    - ai_toolchain_operator_enabled
    - automatic_upgrade_channel
    - azure_policy_enabled
    - cost_analysis_enabled
    - custom_ca_trust_certificates_base64
    - disk_encryption_set_id
    - dns_prefix
    - dns_prefix_private_cluster
    - edge_zone
    - http_application_routing_enabled
    - image_cleaner_enabled
    - image_cleaner_interval_hours
    - kubernetes_version
    - local_account_disabled
    - node_os_upgrade_channel
    - node_resource_group
    - oidc_issuer_enabled
    - open_service_mesh_enabled
    - private_cluster_enabled
    - private_cluster_public_fqdn_enabled
    - private_dns_zone_id
    - role_based_access_control_enabled
    - run_command_enabled
    - sku_tier
    - support_plan
    - tags
    - workload_identity_enabled
    - aci_connector_linux
    - api_server_access_profile
    - auto_scaler_profile
    - azure_active_directory_role_based_access_control
    - bootstrap_profile
    - confidential_computing
    - http_proxy_config
    - identity
    - ingress_application_gateway
    - key_management_service
    - key_vault_secrets_provider
    - kubelet_identity
    - linux_profile
    - maintenance_window
    - maintenance_window_auto_upgrade
    - maintenance_window_node_os
    - microsoft_defender
    - monitor_metrics
    - network_profile
    - node_provisioning_profile
    - oms_agent
    - service_mesh_profile
    - service_principal
    - storage_profile
    - upgrade_override
    - web_app_routing
    - windows_profile
    - workload_autoscaler_profile
EOT

  type = map(object({
    location                                         = string
    name                                             = string
    resource_group_name                              = string
    ai_toolchain_operator_enabled                    = optional(bool)
    automatic_upgrade_channel                        = optional(string)
    azure_policy_enabled                             = optional(bool)
    cost_analysis_enabled                            = optional(bool)
    custom_ca_trust_certificates_base64              = optional(list(string))
    disk_encryption_set_id                           = optional(string)
    dns_prefix                                       = optional(string)
    dns_prefix_private_cluster                       = optional(string)
    edge_zone                                        = optional(string)
    http_application_routing_enabled                 = optional(bool)
    image_cleaner_enabled                            = optional(bool)
    image_cleaner_interval_hours                     = optional(number)
    kubernetes_version                               = optional(string)
    local_account_disabled                           = optional(bool)
    node_os_upgrade_channel                          = optional(string)
    node_resource_group                              = optional(string)
    oidc_issuer_enabled                              = optional(bool)
    open_service_mesh_enabled                        = optional(bool)
    private_cluster_enabled                          = optional(bool)
    private_cluster_public_fqdn_enabled              = optional(bool)
    private_dns_zone_id                              = optional(string)
    role_based_access_control_enabled                = optional(bool)
    run_command_enabled                              = optional(bool)
    sku_tier                                         = optional(string)
    support_plan                                     = optional(string)
    tags                                             = optional(map(string))
    workload_identity_enabled                        = optional(bool)
    aci_connector_linux                              = optional(list(object({
            subnet_name = string
        })))
    api_server_access_profile                        = optional(list(object({
            authorized_ip_ranges                = optional(set(string))
            subnet_id                           = optional(string)
            virtual_network_integration_enabled = optional(bool)
        })))
    auto_scaler_profile                              = optional(list(object({
            balance_similar_node_groups                   = optional(bool)
            daemonset_eviction_for_empty_nodes_enabled    = optional(bool)
            daemonset_eviction_for_occupied_nodes_enabled = optional(bool)
            empty_bulk_delete_max                         = optional(string)
            expander                                      = optional(string)
            ignore_daemonsets_utilization_enabled         = optional(bool)
            max_graceful_termination_sec                  = optional(string)
            max_node_provisioning_time                    = optional(string)
            max_unready_nodes                             = optional(number)
            max_unready_percentage                        = optional(number)
            new_pod_scale_up_delay                        = optional(string)
            scale_down_delay_after_add                    = optional(string)
            scale_down_delay_after_delete                 = optional(string)
            scale_down_delay_after_failure                = optional(string)
            scale_down_unneeded                           = optional(string)
            scale_down_unready                            = optional(string)
            scale_down_utilization_threshold              = optional(string)
            scan_interval                                 = optional(string)
            skip_nodes_with_local_storage                 = optional(bool)
            skip_nodes_with_system_pods                   = optional(bool)
        })))
    azure_active_directory_role_based_access_control = optional(list(object({
            admin_group_object_ids = optional(list(string))
            azure_rbac_enabled     = optional(bool)
            tenant_id              = optional(string)
        })))
    bootstrap_profile                                = optional(list(object({
            artifact_source       = optional(string)
            container_registry_id = optional(string)
        })))
    confidential_computing                           = optional(list(object({
            sgx_quote_helper_enabled = bool
        })))
    default_node_pool                                = list(object({
            name                          = string
            auto_scaling_enabled          = optional(bool)
            capacity_reservation_group_id = optional(string)
            fips_enabled                  = optional(bool)
            gpu_driver                    = optional(string)
            gpu_instance                  = optional(string)
            host_encryption_enabled       = optional(bool)
            host_group_id                 = optional(string)
            kubelet_disk_type             = optional(string)
            max_count                     = optional(number)
            max_pods                      = optional(number)
            min_count                     = optional(number)
            node_count                    = optional(number)
            node_labels                   = optional(map(string))
            node_public_ip_enabled        = optional(bool)
            node_public_ip_prefix_id      = optional(string)
            only_critical_addons_enabled  = optional(bool)
            orchestrator_version          = optional(string)
            os_disk_size_gb               = optional(number)
            os_disk_type                  = optional(string)
            os_sku                        = optional(string)
            pod_subnet_id                 = optional(string)
            proximity_placement_group_id  = optional(string)
            scale_down_mode               = optional(string)
            snapshot_id                   = optional(string)
            tags                          = optional(map(string))
            temporary_name_for_rotation   = optional(string)
            type                          = optional(string)
            ultra_ssd_enabled             = optional(bool)
            vm_size                       = optional(string)
            vnet_subnet_id                = optional(string)
            workload_runtime              = optional(string)
            zones                         = optional(set(string))
            kubelet_config                = optional(list(object({
                allowed_unsafe_sysctls    = optional(set(string))
                container_log_max_line    = optional(number)
                container_log_max_size_mb = optional(number)
                cpu_cfs_quota_enabled     = optional(bool)
                cpu_cfs_quota_period      = optional(string)
                cpu_manager_policy        = optional(string)
                image_gc_high_threshold   = optional(number)
                image_gc_low_threshold    = optional(number)
                pod_max_pid               = optional(number)
                topology_manager_policy   = optional(string)
            })))
            linux_os_config               = optional(list(object({
                swap_file_size_mb             = optional(number)
                transparent_huge_page         = optional(string)
                transparent_huge_page_defrag  = optional(string)
                transparent_huge_page_enabled = optional(string)
                sysctl_config                 = optional(list(object({
                    fs_aio_max_nr                      = optional(number)
                    fs_file_max                        = optional(number)
                    fs_inotify_max_user_watches        = optional(number)
                    fs_nr_open                         = optional(number)
                    kernel_threads_max                 = optional(number)
                    net_core_netdev_max_backlog        = optional(number)
                    net_core_optmem_max                = optional(number)
                    net_core_rmem_default              = optional(number)
                    net_core_rmem_max                  = optional(number)
                    net_core_somaxconn                 = optional(number)
                    net_core_wmem_default              = optional(number)
                    net_core_wmem_max                  = optional(number)
                    net_ipv4_ip_local_port_range_max   = optional(number)
                    net_ipv4_ip_local_port_range_min   = optional(number)
                    net_ipv4_neigh_default_gc_thresh1  = optional(number)
                    net_ipv4_neigh_default_gc_thresh2  = optional(number)
                    net_ipv4_neigh_default_gc_thresh3  = optional(number)
                    net_ipv4_tcp_fin_timeout           = optional(number)
                    net_ipv4_tcp_keepalive_intvl       = optional(number)
                    net_ipv4_tcp_keepalive_probes      = optional(number)
                    net_ipv4_tcp_keepalive_time        = optional(number)
                    net_ipv4_tcp_max_syn_backlog       = optional(number)
                    net_ipv4_tcp_max_tw_buckets        = optional(number)
                    net_ipv4_tcp_tw_reuse              = optional(bool)
                    net_netfilter_nf_conntrack_buckets = optional(number)
                    net_netfilter_nf_conntrack_max     = optional(number)
                    vm_max_map_count                   = optional(number)
                    vm_swappiness                      = optional(number)
                    vm_vfs_cache_pressure              = optional(number)
                })))
            })))
            node_network_profile          = optional(list(object({
                application_security_group_ids = optional(list(string))
                node_public_ip_tags            = optional(map(string))
                allowed_host_ports             = optional(list(object({
                    port_end   = optional(number)
                    port_start = optional(number)
                    protocol   = optional(string)
                })))
            })))
            upgrade_settings              = optional(list(object({
                max_surge                     = string
                drain_timeout_in_minutes      = optional(number)
                node_soak_duration_in_minutes = optional(number)
                undrainable_node_behavior     = optional(string)
            })))
        }))
    http_proxy_config                                = optional(list(object({
            http_proxy  = optional(string)
            https_proxy = optional(string)
            no_proxy    = optional(set(string))
            trusted_ca  = optional(string)
        })))
    identity                                         = optional(list(object({
            type         = string
            identity_ids = optional(set(string))
        })))
    ingress_application_gateway                      = optional(list(object({
            gateway_id   = optional(string)
            gateway_name = optional(string)
            subnet_cidr  = optional(string)
            subnet_id    = optional(string)
        })))
    key_management_service                           = optional(list(object({
            key_vault_key_id         = string
            key_vault_network_access = optional(string)
        })))
    key_vault_secrets_provider                       = optional(list(object({
            secret_rotation_enabled  = optional(bool)
            secret_rotation_interval = optional(string)
        })))
    kubelet_identity                                 = optional(list(object({
            client_id                 = optional(string)
            object_id                 = optional(string)
            user_assigned_identity_id = optional(string)
        })))
    linux_profile                                    = optional(list(object({
            admin_username = string
            ssh_key        = list(object({
                key_data = string
            }))
        })))
    maintenance_window                               = optional(list(object({
            allowed     = optional(set(object({
                day   = string
                hours = set(number)
            })))
            not_allowed = optional(set(object({
                end   = string
                start = string
            })))
        })))
    maintenance_window_auto_upgrade                  = optional(list(object({
            duration     = number
            frequency    = string
            interval     = number
            day_of_month = optional(number)
            day_of_week  = optional(string)
            start_date   = optional(string)
            start_time   = optional(string)
            utc_offset   = optional(string)
            week_index   = optional(string)
            not_allowed  = optional(set(object({
                end   = string
                start = string
            })))
        })))
    maintenance_window_node_os                       = optional(list(object({
            duration     = number
            frequency    = string
            interval     = number
            day_of_month = optional(number)
            day_of_week  = optional(string)
            start_date   = optional(string)
            start_time   = optional(string)
            utc_offset   = optional(string)
            week_index   = optional(string)
            not_allowed  = optional(set(object({
                end   = string
                start = string
            })))
        })))
    microsoft_defender                               = optional(list(object({
            log_analytics_workspace_id = string
        })))
    monitor_metrics                                  = optional(list(object({
            annotations_allowed = optional(string)
            labels_allowed      = optional(string)
        })))
    network_profile                                  = optional(list(object({
            network_plugin        = string
            dns_service_ip        = optional(string)
            ip_versions           = optional(list(string))
            load_balancer_sku     = optional(string)
            network_data_plane    = optional(string)
            network_mode          = optional(string)
            network_plugin_mode   = optional(string)
            network_policy        = optional(string)
            outbound_type         = optional(string)
            pod_cidr              = optional(string)
            pod_cidrs             = optional(list(string))
            service_cidr          = optional(string)
            service_cidrs         = optional(list(string))
            advanced_networking   = optional(list(object({
                observability_enabled = optional(bool)
                security_enabled      = optional(bool)
            })))
            load_balancer_profile = optional(list(object({
                backend_pool_type           = optional(string)
                idle_timeout_in_minutes     = optional(number)
                managed_outbound_ip_count   = optional(number)
                managed_outbound_ipv6_count = optional(number)
                outbound_ip_address_ids     = optional(set(string))
                outbound_ip_prefix_ids      = optional(set(string))
                outbound_ports_allocated    = optional(number)
            })))
            nat_gateway_profile   = optional(list(object({
                idle_timeout_in_minutes   = optional(number)
                managed_outbound_ip_count = optional(number)
            })))
        })))
    node_provisioning_profile                        = optional(list(object({
            default_node_pools = optional(string)
            mode               = optional(string)
        })))
    oms_agent                                        = optional(list(object({
            log_analytics_workspace_id      = string
            msi_auth_for_monitoring_enabled = optional(bool)
        })))
    service_mesh_profile                             = optional(list(object({
            mode                             = string
            revisions                        = list(string)
            external_ingress_gateway_enabled = optional(bool)
            internal_ingress_gateway_enabled = optional(bool)
            certificate_authority            = optional(list(object({
                cert_chain_object_name = string
                cert_object_name       = string
                key_object_name        = string
                key_vault_id           = string
                root_cert_object_name  = string
            })))
        })))
    service_principal                                = optional(list(object({
            client_id     = string
            client_secret = string
        })))
    storage_profile                                  = optional(list(object({
            blob_driver_enabled         = optional(bool)
            disk_driver_enabled         = optional(bool)
            file_driver_enabled         = optional(bool)
            snapshot_controller_enabled = optional(bool)
        })))
    upgrade_override                                 = optional(list(object({
            force_upgrade_enabled = bool
            effective_until       = optional(string)
        })))
    web_app_routing                                  = optional(list(object({
            dns_zone_ids             = list(string)
            default_nginx_controller = optional(string)
        })))
    windows_profile                                  = optional(list(object({
            admin_password = string
            admin_username = string
            license        = optional(string)
            gmsa           = optional(list(object({
                dns_server  = string
                root_domain = string
            })))
        })))
    workload_autoscaler_profile                      = optional(list(object({
            keda_enabled                    = optional(bool)
            vertical_pod_autoscaler_enabled = optional(bool)
        })))
  }))
}
