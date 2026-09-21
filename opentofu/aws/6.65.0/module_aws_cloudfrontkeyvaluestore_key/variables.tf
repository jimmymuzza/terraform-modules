variable "cloudfrontkeyvaluestore_keys" {
  description = <<EOT
Map of cloudfrontkeyvaluestore_keys, attributes below
Required:
    - key
    - key_value_store_arn
    - value
EOT

  type = map(object({
    key                 = string
    key_value_store_arn = string
    value               = string
  }))
}
