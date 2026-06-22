resource "aws_ec2_network_insights_analysis" "ec2_network_insights_analysis" {
  for_each = var.ec2_network_insights_analysis

  network_insights_path_id = each.value.network_insights_path_id
  filter_in_arns           = each.value.filter_in_arns
  region                   = each.value.region
  tags                     = each.value.tags
  tags_all                 = each.value.tags_all
  wait_for_completion      = each.value.wait_for_completion
}
