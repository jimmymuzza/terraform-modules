resource "aws_ec2_instance_metadata_defaults" "ec2_instance_metadata_defaults" {
  for_each = var.ec2_instance_metadata_defaults

  http_endpoint               = each.value.http_endpoint
  http_put_response_hop_limit = each.value.http_put_response_hop_limit
  http_tokens                 = each.value.http_tokens
  instance_metadata_tags      = each.value.instance_metadata_tags
  region                      = each.value.region
}
