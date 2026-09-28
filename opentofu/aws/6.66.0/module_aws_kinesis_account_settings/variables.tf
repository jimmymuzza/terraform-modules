variable "kinesis_account_settings" {
  description = <<EOT
Map of kinesis_account_settings, attributes below
Optional:
    - region
    - minimum_throughput_billing_commitment
EOT

  type = map(object({
    region                                = optional(string)
    minimum_throughput_billing_commitment = optional(list(object({
            status = string
        })))
  }))
}
