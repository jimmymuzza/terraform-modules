variable "bedrock_use_case_for_model_accesses" {
  description = <<EOT
Map of bedrock_use_case_for_model_accesses, attributes below
Required:
    - form_data
EOT

  type = map(object({
    form_data = string
  }))
}
