variable "paymentcryptography_keys" {
  description = <<EOT
Map of paymentcryptography_keys, attributes below
Required:
    - exportable
Optional:
    - deletion_window_in_days
    - enabled
    - key_check_value_algorithm
    - region
    - tags
    - key_attributes
EOT

  type = map(object({
    exportable                = bool
    deletion_window_in_days   = optional(number)
    enabled                   = optional(bool)
    key_check_value_algorithm = optional(string)
    region                    = optional(string)
    tags                      = optional(map(string))
    key_attributes            = optional(list(object({
            key_algorithm    = string
            key_class        = string
            key_usage        = string
            key_modes_of_use = optional(list(object({
                decrypt         = optional(bool)
                derive_key      = optional(bool)
                encrypt         = optional(bool)
                generate        = optional(bool)
                no_restrictions = optional(bool)
                sign            = optional(bool)
                unwrap          = optional(bool)
                verify          = optional(bool)
                wrap            = optional(bool)
            })))
        })))
  }))
}
