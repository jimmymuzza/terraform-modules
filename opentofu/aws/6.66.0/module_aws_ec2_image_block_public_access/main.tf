resource "aws_ec2_image_block_public_access" "ec2_image_block_public_accesses" {
  for_each = var.ec2_image_block_public_accesses

  state  = each.value.state
  region = each.value.region
}
