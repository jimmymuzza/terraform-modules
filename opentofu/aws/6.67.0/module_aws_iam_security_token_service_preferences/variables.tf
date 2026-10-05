variable "iam_security_token_service_preferences" {
  description = <<EOT
Map of iam_security_token_service_preferences, attributes below
Required:
    - global_endpoint_token_version
EOT

  type = map(object({
    global_endpoint_token_version = string
  }))
}
