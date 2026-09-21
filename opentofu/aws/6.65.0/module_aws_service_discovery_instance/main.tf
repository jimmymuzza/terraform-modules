resource "aws_service_discovery_instance" "service_discovery_instances" {
  for_each = var.service_discovery_instances

  attributes  = each.value.attributes
  instance_id = each.value.instance_id
  service_id  = each.value.service_id
  region      = each.value.region
}
