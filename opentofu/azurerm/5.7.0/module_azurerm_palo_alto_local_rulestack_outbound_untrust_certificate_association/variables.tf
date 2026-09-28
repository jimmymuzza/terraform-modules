variable "palo_alto_local_rulestack_outbound_untrust_certificate_associations" {
  description = <<EOT
Map of palo_alto_local_rulestack_outbound_untrust_certificate_associations, attributes below
Required:
    - certificate_id
EOT

  type = map(object({
    certificate_id = string
  }))
}
