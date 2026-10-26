variable "guardduty_filters" {
  description = <<EOT
Map of guardduty_filters, attributes below
Required:
    - action
    - detector_id
    - name
    - rank
    - finding_criteria
Optional:
    - description
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    action           = string
    detector_id      = string
    name             = string
    rank             = number
    description      = optional(string)
    region           = optional(string)
    tags             = optional(map(string))
    tags_all         = optional(map(string))
    finding_criteria = list(object({
            criterion = set(object({
                field                 = string
                equals                = optional(list(string))
                greater_than          = optional(string)
                greater_than_or_equal = optional(string)
                less_than             = optional(string)
                less_than_or_equal    = optional(string)
                matches               = optional(list(string))
                not_equals            = optional(list(string))
                not_matches           = optional(list(string))
            }))
        }))
  }))
}
