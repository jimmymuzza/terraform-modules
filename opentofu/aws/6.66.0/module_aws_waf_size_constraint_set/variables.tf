variable "waf_size_constraint_sets" {
  description = <<EOT
Map of waf_size_constraint_sets, attributes below
Required:
    - name
Optional:
    - size_constraints
EOT

  type = map(object({
    name             = string
    size_constraints = optional(set(object({
            comparison_operator = string
            size                = number
            text_transformation = string
            field_to_match      = list(object({
                type = string
                data = optional(string)
            }))
        })))
  }))
}
