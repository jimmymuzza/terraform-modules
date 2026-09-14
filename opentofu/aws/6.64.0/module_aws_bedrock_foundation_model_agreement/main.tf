resource "aws_bedrock_foundation_model_agreement" "bedrock_foundation_model_agreements" {
  for_each = var.bedrock_foundation_model_agreements

  model_id    = each.value.model_id
  offer_token = each.value.offer_token
  region      = each.value.region
}
