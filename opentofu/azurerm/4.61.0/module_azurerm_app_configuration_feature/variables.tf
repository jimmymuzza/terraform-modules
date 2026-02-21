variable "app_configuration_features" {
  description = <<EOT
Map of app_configuration_features, attributes below
Required:
    - configuration_store_id
    - name
Optional:
    - description
    - enabled
    - etag
    - key
    - label
    - locked
    - percentage_filter_value
    - tags
    - targeting_filter
    - timewindow_filter
EOT

  type = map(object({
    configuration_store_id  = string
    name                    = string
    description             = optional(string)
    enabled                 = optional(bool)
    etag                    = optional(string)
    key                     = optional(string)
    label                   = optional(string)
    locked                  = optional(bool)
    percentage_filter_value = optional(number)
    tags                    = optional(map(string))
    targeting_filter        = optional(list(object({
            default_rollout_percentage = number
            users                      = optional(list(string))
            groups                     = optional(list(object({
                name               = string
                rollout_percentage = number
            })))
        })))
    timewindow_filter       = optional(list(object({
            end   = optional(string)
            start = optional(string)
        })))
  }))
}
