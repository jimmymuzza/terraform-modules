variable "iam_groups" {
  description = <<EOT
Map of iam_groups, attributes below
Required:
    - name
Optional:
    - path
EOT

  type = map(object({
    name = string
    path = optional(string)
  }))
}
