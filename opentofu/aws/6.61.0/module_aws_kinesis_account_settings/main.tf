resource "aws_kinesis_account_settings" "kinesis_account_settings" {
  for_each = var.kinesis_account_settings

  region = each.value.region

  dynamic "minimum_throughput_billing_commitment" {
    for_each = each.value.minimum_throughput_billing_commitment != null ? each.value.minimum_throughput_billing_commitment : []
    content {
      status = minimum_throughput_billing_commitment.value.status
    }
  }
}
