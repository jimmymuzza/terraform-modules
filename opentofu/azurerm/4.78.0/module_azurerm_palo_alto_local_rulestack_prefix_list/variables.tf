variable "palo_alto_local_rulestack_prefix_lists" {
  description = <<EOT
Map of palo_alto_local_rulestack_prefix_lists, attributes below
Required:
    - name
    - prefix_list
    - rulestack_id
Optional:
    - audit_comment
    - description
EOT

  type = map(object({
    name          = string
    prefix_list   = list(string)
    rulestack_id  = string
    audit_comment = optional(string)
    description   = optional(string)
  }))
}
