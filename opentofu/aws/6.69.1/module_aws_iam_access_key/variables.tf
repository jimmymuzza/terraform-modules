variable "iam_access_keys" {
  description = <<EOT
Map of iam_access_keys, attributes below
Required:
    - user
Optional:
    - pgp_key
    - status
EOT

  type = map(object({
    user    = string
    pgp_key = optional(string)
    status  = optional(string)
  }))
}
