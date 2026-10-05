variable "bedrock_provisioned_model_throughputs" {
  description = <<EOT
Map of bedrock_provisioned_model_throughputs, attributes below
Required:
    - model_arn
    - model_units
    - provisioned_model_name
Optional:
    - commitment_duration
    - region
    - tags
EOT

  type = map(object({
    model_arn              = string
    model_units            = number
    provisioned_model_name = string
    commitment_duration    = optional(string)
    region                 = optional(string)
    tags                   = optional(map(string))
  }))
}
