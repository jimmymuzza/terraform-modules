resource "aws_bedrock_guardrail_version" "bedrock_guardrail_versions" {
  for_each = var.bedrock_guardrail_versions

  guardrail_arn = each.value.guardrail_arn
  description   = each.value.description
  region        = each.value.region
  skip_destroy  = each.value.skip_destroy
}
