variable "iam_user_ssh_keys" {
  description = <<EOT
Map of iam_user_ssh_keys, attributes below
Required:
    - encoding
    - public_key
    - username
Optional:
    - status
EOT

  type = map(object({
    encoding   = string
    public_key = string
    username   = string
    status     = optional(string)
  }))
}
