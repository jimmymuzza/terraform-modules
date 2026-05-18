variable "sagemaker_images" {
  description = <<EOT
Map of sagemaker_images, attributes below
Required:
    - image_name
    - role_arn
Optional:
    - description
    - display_name
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    image_name   = string
    role_arn     = string
    description  = optional(string)
    display_name = optional(string)
    region       = optional(string)
    tags         = optional(map(string))
    tags_all     = optional(map(string))
  }))
}
