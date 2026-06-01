resource "aws_bedrock_provisioned_model_throughput" "bedrock_provisioned_model_throughputs" {
  for_each = var.bedrock_provisioned_model_throughputs

  model_arn              = each.value.model_arn
  model_units            = each.value.model_units
  provisioned_model_name = each.value.provisioned_model_name
  commitment_duration    = each.value.commitment_duration
  region                 = each.value.region
  tags                   = each.value.tags
}
