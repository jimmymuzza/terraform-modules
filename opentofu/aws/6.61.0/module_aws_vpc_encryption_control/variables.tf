variable "vpc_encryption_controls" {
  description = <<EOT
Map of vpc_encryption_controls, attributes below
Required:
    - mode
    - vpc_id
Optional:
    - egress_only_internet_gateway_exclusion
    - elastic_file_system_exclusion
    - internet_gateway_exclusion
    - lambda_exclusion
    - nat_gateway_exclusion
    - region
    - tags
    - virtual_private_gateway_exclusion
    - vpc_lattice_exclusion
    - vpc_peering_exclusion
EOT

  type = map(object({
    mode                                   = string
    vpc_id                                 = string
    egress_only_internet_gateway_exclusion = optional(string)
    elastic_file_system_exclusion          = optional(string)
    internet_gateway_exclusion             = optional(string)
    lambda_exclusion                       = optional(string)
    nat_gateway_exclusion                  = optional(string)
    region                                 = optional(string)
    tags                                   = optional(map(string))
    virtual_private_gateway_exclusion      = optional(string)
    vpc_lattice_exclusion                  = optional(string)
    vpc_peering_exclusion                  = optional(string)
  }))
}
