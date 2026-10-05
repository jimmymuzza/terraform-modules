variable "backup_selections" {
  description = <<EOT
Map of backup_selections, attributes below
Required:
    - iam_role_arn
    - name
    - plan_id
Optional:
    - not_resources
    - region
    - resources
    - condition
    - selection_tag
EOT

  type = map(object({
    iam_role_arn  = string
    name          = string
    plan_id       = string
    not_resources = optional(set(string))
    region        = optional(string)
    resources     = optional(set(string))
    condition     = optional(set(object({
            string_equals     = optional(set(object({
                key   = string
                value = string
            })))
            string_like       = optional(set(object({
                key   = string
                value = string
            })))
            string_not_equals = optional(set(object({
                key   = string
                value = string
            })))
            string_not_like   = optional(set(object({
                key   = string
                value = string
            })))
        })))
    selection_tag = optional(set(object({
            key   = string
            type  = string
            value = string
        })))
  }))
}
