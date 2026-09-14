variable "directory_service_trusts" {
  description = <<EOT
Map of directory_service_trusts, attributes below
Required:
    - directory_id
    - remote_domain_name
    - trust_direction
    - trust_password
Optional:
    - conditional_forwarder_ip_addrs
    - delete_associated_conditional_forwarder
    - region
    - selective_auth
    - trust_type
EOT

  type = map(object({
    directory_id                            = string
    remote_domain_name                      = string
    trust_direction                         = string
    trust_password                          = string
    conditional_forwarder_ip_addrs          = optional(set(string))
    delete_associated_conditional_forwarder = optional(bool)
    region                                  = optional(string)
    selective_auth                          = optional(string)
    trust_type                              = optional(string)
  }))
}
