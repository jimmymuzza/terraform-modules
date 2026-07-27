variable "iam_account_password_policies" {
  description = <<EOT
Map of iam_account_password_policies, attributes below
Optional:
    - allow_users_to_change_password
    - hard_expiry
    - max_password_age
    - minimum_password_length
    - password_reuse_prevention
    - require_lowercase_characters
    - require_numbers
    - require_symbols
    - require_uppercase_characters
EOT

  type = map(object({
    allow_users_to_change_password = optional(bool)
    hard_expiry                    = optional(bool)
    max_password_age               = optional(number)
    minimum_password_length        = optional(number)
    password_reuse_prevention      = optional(number)
    require_lowercase_characters   = optional(bool)
    require_numbers                = optional(bool)
    require_symbols                = optional(bool)
    require_uppercase_characters   = optional(bool)
  }))
}
