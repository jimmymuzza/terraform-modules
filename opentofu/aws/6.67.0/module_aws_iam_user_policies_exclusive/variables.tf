variable "iam_user_policies_exclusives" {
  description = <<EOT
Map of iam_user_policies_exclusives, attributes below
Required:
    - policy_names
    - user_name
EOT

  type = map(object({
    policy_names = set(string)
    user_name    = string
  }))
}
