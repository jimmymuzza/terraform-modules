variable "xray_indexing_rules" {
  description = <<EOT
Map of xray_indexing_rules, attributes below
Required:
    - name
Optional:
    - region
    - rule
EOT

  type = map(object({
    name   = string
    region = optional(string)
    rule   = optional(list(object({
            probabilistic = optional(list(object({
                desired_sampling_percentage = number
            })))
        })))
  }))
}
