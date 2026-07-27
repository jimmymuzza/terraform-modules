variable "wafregional_geo_match_sets" {
  description = <<EOT
Map of wafregional_geo_match_sets, attributes below
Required:
    - name
Optional:
    - region
    - geo_match_constraint
EOT

  type = map(object({
    name                 = string
    region               = optional(string)
    geo_match_constraint = optional(set(object({
            type  = string
            value = string
        })))
  }))
}
