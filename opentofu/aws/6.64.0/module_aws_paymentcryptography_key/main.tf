resource "aws_paymentcryptography_key" "paymentcryptography_keys" {
  for_each = var.paymentcryptography_keys

  exportable                = each.value.exportable
  deletion_window_in_days   = each.value.deletion_window_in_days
  enabled                   = each.value.enabled
  key_check_value_algorithm = each.value.key_check_value_algorithm
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "key_attributes" {
    for_each = each.value.key_attributes != null ? each.value.key_attributes : []
    content {
      key_algorithm = key_attributes.value.key_algorithm
      key_class     = key_attributes.value.key_class
      key_usage     = key_attributes.value.key_usage

      dynamic "key_modes_of_use" {
        for_each = key_attributes.value.key_modes_of_use != null ? key_attributes.value.key_modes_of_use : []
        content {
          decrypt         = key_modes_of_use.value.decrypt
          derive_key      = key_modes_of_use.value.derive_key
          encrypt         = key_modes_of_use.value.encrypt
          generate        = key_modes_of_use.value.generate
          no_restrictions = key_modes_of_use.value.no_restrictions
          sign            = key_modes_of_use.value.sign
          unwrap          = key_modes_of_use.value.unwrap
          verify          = key_modes_of_use.value.verify
          wrap            = key_modes_of_use.value.wrap
        }
      }
    }
  }
}
