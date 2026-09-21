variable "network_manager_verifier_workspace_reachability_analysis_intents" {
  description = <<EOT
Map of network_manager_verifier_workspace_reachability_analysis_intents, attributes below
Required:
    - destination_resource_id
    - name
    - source_resource_id
    - verifier_workspace_id
    - ip_traffic
Optional:
    - description
EOT

  type = map(object({
    destination_resource_id = string
    name                    = string
    source_resource_id      = string
    verifier_workspace_id   = string
    description             = optional(string)
    ip_traffic              = list(object({
            destination_ips   = list(string)
            destination_ports = list(string)
            protocols         = list(string)
            source_ips        = list(string)
            source_ports      = list(string)
        }))
  }))
}
