variable "palo_alto_local_rulestack_rules" {
  description = <<EOT
Map of palo_alto_local_rulestack_rules, attributes below
Required:
    - action
    - applications
    - name
    - priority
    - rulestack_id
    - destination
    - source
Optional:
    - audit_comment
    - decryption_rule_type
    - description
    - enabled
    - inspection_certificate_id
    - logging_enabled
    - negate_destination
    - negate_source
    - protocol
    - protocol_ports
    - tags
    - category
EOT

  type = map(object({
    action                    = string
    applications              = list(string)
    name                      = string
    priority                  = number
    rulestack_id              = string
    audit_comment             = optional(string)
    decryption_rule_type      = optional(string)
    description               = optional(string)
    enabled                   = optional(bool)
    inspection_certificate_id = optional(string)
    logging_enabled           = optional(bool)
    negate_destination        = optional(bool)
    negate_source             = optional(bool)
    protocol                  = optional(string)
    protocol_ports            = optional(list(string))
    tags                      = optional(map(string))
    category                  = optional(list(object({
            custom_urls = list(string)
            feeds       = optional(list(string))
        })))
    destination               = list(object({
            cidrs                           = optional(list(string))
            countries                       = optional(list(string))
            feeds                           = optional(list(string))
            local_rulestack_fqdn_list_ids   = optional(list(string))
            local_rulestack_prefix_list_ids = optional(list(string))
        }))
    source                    = list(object({
            cidrs                           = optional(list(string))
            countries                       = optional(list(string))
            feeds                           = optional(list(string))
            local_rulestack_prefix_list_ids = optional(list(string))
        }))
  }))
}
