variable "sagemaker_hub_content_references" {
  description = <<EOT
Map of sagemaker_hub_content_references, attributes below
Required:
    - hub_content_name
    - hub_name
    - sagemaker_public_hub_content_arn
Optional:
    - min_version
    - region
    - tags
EOT

  type = map(object({
    hub_content_name                 = string
    hub_name                         = string
    sagemaker_public_hub_content_arn = string
    min_version                      = optional(string)
    region                           = optional(string)
    tags                             = optional(map(string))
  }))
}
