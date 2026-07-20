resource "aws_ssoadmin_region" "ssoadmin_regions" {
  for_each = var.ssoadmin_regions

  instance_arn = each.value.instance_arn
  region_name  = each.value.region_name
  region       = each.value.region
}
