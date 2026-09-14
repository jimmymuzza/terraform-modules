variable "quicksight_iam_policy_assignments" {
  description = <<EOT
Map of quicksight_iam_policy_assignments, attributes below
Required:
    - assignment_name
    - assignment_status
Optional:
    - aws_account_id
    - namespace
    - policy_arn
    - region
    - identities
EOT

  type = map(object({
    assignment_name   = string
    assignment_status = string
    aws_account_id    = optional(string)
    namespace         = optional(string)
    policy_arn        = optional(string)
    region            = optional(string)
    identities        = optional(list(object({
            group = optional(set(string))
            user  = optional(set(string))
        })))
  }))
}
