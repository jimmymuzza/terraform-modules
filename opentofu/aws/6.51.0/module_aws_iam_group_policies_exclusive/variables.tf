variable "iam_group_policies_exclusives" {
  description = <<EOT
Map of iam_group_policies_exclusives, attributes below
Required:
    - group_name
    - policy_names
EOT

  type = map(object({
    group_name   = string
    policy_names = set(string)
  }))
}
