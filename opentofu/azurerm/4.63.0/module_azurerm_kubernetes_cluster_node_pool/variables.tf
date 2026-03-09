variable "kubernetes_cluster_node_pools" {
  description = <<EOT
Map of kubernetes_cluster_node_pools, attributes below
Required:
    - kubernetes_cluster_id
    - name
Optional:
    - auto_scaling_enabled
    - capacity_reservation_group_id
    - eviction_policy
    - fips_enabled
    - gpu_driver
    - gpu_instance
    - host_encryption_enabled
    - host_group_id
    - kubelet_disk_type
    - max_count
    - max_pods
    - min_count
    - mode
    - node_count
    - node_labels
    - node_public_ip_enabled
    - node_public_ip_prefix_id
    - node_taints
    - orchestrator_version
    - os_disk_size_gb
    - os_disk_type
    - os_sku
    - os_type
    - pod_subnet_id
    - priority
    - proximity_placement_group_id
    - scale_down_mode
    - snapshot_id
    - spot_max_price
    - tags
    - temporary_name_for_rotation
    - ultra_ssd_enabled
    - vm_size
    - vnet_subnet_id
    - workload_runtime
    - zones
    - kubelet_config
    - linux_os_config
    - node_network_profile
    - upgrade_settings
    - windows_profile
EOT

  type = map(object({
    kubernetes_cluster_id         = string
    name                          = string
    auto_scaling_enabled          = optional(bool)
    capacity_reservation_group_id = optional(string)
    eviction_policy               = optional(string)
    fips_enabled                  = optional(bool)
    gpu_driver                    = optional(string)
    gpu_instance                  = optional(string)
    host_encryption_enabled       = optional(bool)
    host_group_id                 = optional(string)
    kubelet_disk_type             = optional(string)
    max_count                     = optional(number)
    max_pods                      = optional(number)
    min_count                     = optional(number)
    mode                          = optional(string)
    node_count                    = optional(number)
    node_labels                   = optional(map(string))
    node_public_ip_enabled        = optional(bool)
    node_public_ip_prefix_id      = optional(string)
    node_taints                   = optional(list(string))
    orchestrator_version          = optional(string)
    os_disk_size_gb               = optional(number)
    os_disk_type                  = optional(string)
    os_sku                        = optional(string)
    os_type                       = optional(string)
    pod_subnet_id                 = optional(string)
    priority                      = optional(string)
    proximity_placement_group_id  = optional(string)
    scale_down_mode               = optional(string)
    snapshot_id                   = optional(string)
    spot_max_price                = optional(number)
    tags                          = optional(map(string))
    temporary_name_for_rotation   = optional(string)
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
            drain_timeout_in_minutes      = optional(number)
            max_surge                     = optional(string)
            max_unavailable               = optional(string)
            node_soak_duration_in_minutes = optional(number)
            undrainable_node_behavior     = optional(string)
        })))
    windows_profile               = optional(list(object({
            outbound_nat_enabled = optional(bool)
        })))
  }))
}
