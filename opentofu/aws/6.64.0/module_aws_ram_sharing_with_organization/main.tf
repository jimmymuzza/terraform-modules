resource "aws_ram_sharing_with_organization" "ram_sharing_with_organizations" {
  for_each = var.ram_sharing_with_organizations

}
