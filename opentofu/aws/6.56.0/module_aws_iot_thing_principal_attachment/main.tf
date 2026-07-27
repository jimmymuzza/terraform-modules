resource "aws_iot_thing_principal_attachment" "iot_thing_principal_attachments" {
  for_each = var.iot_thing_principal_attachments

  principal            = each.value.principal
  thing                = each.value.thing
  region               = each.value.region
  thing_principal_type = each.value.thing_principal_type
}
