variable "ec2_allowed_images_settings" {
  description = <<EOT
Map of ec2_allowed_images_settings, attributes below
Required:
    - state
Optional:
    - region
    - image_criterion
EOT

  type = map(object({
    state           = string
    region          = optional(string)
    image_criterion = optional(list(object({
            image_names                = optional(set(string))
            image_providers            = optional(set(string))
            marketplace_product_codes  = optional(set(string))
            creation_date_condition    = optional(list(object({
                maximum_days_since_created = optional(number)
            })))
            deprecation_time_condition = optional(list(object({
                maximum_days_since_deprecated = optional(number)
            })))
        })))
  }))
}
