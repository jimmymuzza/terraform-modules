resource "aws_resiliencehubv2_assertion" "resiliencehubv2_assertions" {
  for_each = var.resiliencehubv2_assertions

  service_arn = each.value.service_arn
  text        = each.value.text
  region      = each.value.region
}
