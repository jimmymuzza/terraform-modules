resource "aws_lightsail_container_service" "lightsail_container_services" {
  for_each = var.lightsail_container_services

  name        = each.value.name
  power       = each.value.power
  scale       = each.value.scale
  is_disabled = each.value.is_disabled
  region      = each.value.region
  tags        = each.value.tags
  tags_all    = each.value.tags_all

  dynamic "private_registry_access" {
    for_each = each.value.private_registry_access != null ? each.value.private_registry_access : []
    content {

      dynamic "ecr_image_puller_role" {
        for_each = private_registry_access.value.ecr_image_puller_role != null ? private_registry_access.value.ecr_image_puller_role : []
        content {
          is_active = ecr_image_puller_role.value.is_active
        }
      }
    }
  }

  dynamic "public_domain_names" {
    for_each = each.value.public_domain_names != null ? each.value.public_domain_names : []
    content {

      dynamic "certificate" {
        for_each = public_domain_names.value.certificate != null ? public_domain_names.value.certificate : []
        content {
          certificate_name = certificate.value.certificate_name
          domain_names     = certificate.value.domain_names
        }
      }
    }
  }
}
