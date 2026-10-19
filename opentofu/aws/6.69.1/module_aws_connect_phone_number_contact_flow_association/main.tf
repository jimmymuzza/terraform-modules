resource "aws_connect_phone_number_contact_flow_association" "connect_phone_number_contact_flow_associations" {
  for_each = var.connect_phone_number_contact_flow_associations

  contact_flow_id = each.value.contact_flow_id
  instance_id     = each.value.instance_id
  phone_number_id = each.value.phone_number_id
  region          = each.value.region
}
