variable "quicksight_ip_restrictions" {
  description = <<EOT
Map of quicksight_ip_restrictions, attributes below
Required:
    - enabled
Optional:
    - aws_account_id
    - ip_restriction_rule_map
    - region
    - vpc_endpoint_id_restriction_rule_map
    - vpc_id_restriction_rule_map
EOT

  type = map(object({
    enabled                              = bool
    aws_account_id                       = optional(string)
    ip_restriction_rule_map              = optional(map(string))
    region                               = optional(string)
    vpc_endpoint_id_restriction_rule_map = optional(map(string))
    vpc_id_restriction_rule_map          = optional(map(string))
  }))
}
