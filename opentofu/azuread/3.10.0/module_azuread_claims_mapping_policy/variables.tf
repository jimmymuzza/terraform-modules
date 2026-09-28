variable "claims_mapping_policies" {
  description = <<EOT
Map of claims_mapping_policies, attributes below
Required:
    - definition
    - display_name
EOT

  type = map(object({
    definition   = list(string)
    display_name = string
  }))
}
