resource "aws_elb_attachment" "elb_attachments" {
  for_each = var.elb_attachments

  elb      = each.value.elb
  instance = each.value.instance
  region   = each.value.region
}
