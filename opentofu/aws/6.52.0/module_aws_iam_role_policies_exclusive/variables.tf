variable "iam_role_policies_exclusives" {
  description = <<EOT
Map of iam_role_policies_exclusives, attributes below
Required:
    - policy_names
    - role_name
EOT

  type = map(object({
    policy_names = set(string)
    role_name    = string
  }))
}
