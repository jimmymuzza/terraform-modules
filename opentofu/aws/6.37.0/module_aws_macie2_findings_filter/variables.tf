variable "macie2_findings_filters" {
  description = <<EOT
Map of macie2_findings_filters, attributes below
Required:
    - action
    - finding_criteria
Optional:
    - description
    - name
    - name_prefix
    - position
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    action           = string
    description      = optional(string)
    name             = optional(string)
    name_prefix      = optional(string)
    position         = optional(number)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    finding_criteria = list(object({
            criterion = optional(set(object({
                field          = string
                eq             = optional(set(string))
                eq_exact_match = optional(set(string))
                gt             = optional(string)
                gte            = optional(string)
                lt             = optional(string)
                lte            = optional(string)
                neq            = optional(set(string))
            })))
        }))
  }))
}
