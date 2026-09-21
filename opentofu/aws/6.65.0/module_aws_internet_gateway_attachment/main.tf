resource "aws_internet_gateway_attachment" "internet_gateway_attachments" {
  for_each = var.internet_gateway_attachments

  internet_gateway_id = each.value.internet_gateway_id
  vpc_id              = each.value.vpc_id
  region              = each.value.region
}
