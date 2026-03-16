variable "bedrock_inference_profiles" {
  description = <<EOT
Map of bedrock_inference_profiles, attributes below
Required:
    - name
Optional:
    - description
    - region
    - tags
    - model_source
EOT

  type = map(object({
    name         = string
    description  = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    model_source = optional(list(object({
            copy_from = string
        })))
  }))
}
