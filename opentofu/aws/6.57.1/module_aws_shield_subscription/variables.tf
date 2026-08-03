variable "shield_subscriptions" {
  description = <<EOT
Map of shield_subscriptions, attributes below
Optional:
    - auto_renew
    - skip_destroy
EOT

  type = map(object({
    auto_renew   = optional(string)
    skip_destroy = optional(bool)
  }))
}
