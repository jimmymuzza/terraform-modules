variable "lambdacore_network_connectors" {
  description = <<EOT
Map of lambdacore_network_connectors, attributes below
Required:
    - name
    - operator_role
Optional:
    - region
    - configuration
EOT

  type = map(object({
    name          = string
    operator_role = string
    region        = optional(string)
    configuration = optional(list(object({
            vpc_egress_configuration = optional(list(object({
                associated_compute_resource_types = list(string)
                security_group_ids                = set(string)
                subnet_ids                        = set(string)
                network_protocol                  = optional(string)
            })))
        })))
  }))
}
