variable "iam_organizations_features" {
  description = <<EOT
Map of iam_organizations_features, attributes below
Required:
    - enabled_features
EOT

  type = map(object({
    enabled_features = set(string)
  }))
}
