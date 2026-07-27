resource "aws_ssm_activation" "ssm_activations" {
  for_each = var.ssm_activations

  iam_role           = each.value.iam_role
  description        = each.value.description
  expiration_date    = each.value.expiration_date
  name               = each.value.name
  region             = each.value.region
  registration_limit = each.value.registration_limit
  tags               = each.value.tags
  tags_all           = each.value.tags_all
}
