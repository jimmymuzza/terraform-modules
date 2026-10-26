variable "eks_capabilities" {
  description = <<EOT
Map of eks_capabilities, attributes below
Required:
    - capability_name
    - cluster_name
    - delete_propagation_policy
    - role_arn
    - type
Optional:
    - region
    - tags
    - configuration
EOT

  type = map(object({
    capability_name           = string
    cluster_name              = string
    delete_propagation_policy = string
    role_arn                  = string
    type                      = string
    region                    = optional(string)
    tags                      = optional(map(string))
    configuration             = optional(list(object({
            argo_cd = optional(list(object({
                namespace         = optional(string)
                aws_idc           = optional(list(object({
                    idc_instance_arn = string
                    idc_region       = optional(string)
                })))
                network_access    = optional(list(object({
                    vpce_ids = optional(set(string))
                })))
                rbac_role_mapping = optional(set(object({
                    role     = string
                    identity = optional(set(object({
                        type = string
                    })))
                })))
            })))
        })))
  }))
}
