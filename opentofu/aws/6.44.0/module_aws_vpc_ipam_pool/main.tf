resource "aws_vpc_ipam_pool" "vpc_ipam_pools" {
  for_each = var.vpc_ipam_pools

  address_family                    = each.value.address_family
  ipam_scope_id                     = each.value.ipam_scope_id
  allocation_default_netmask_length = each.value.allocation_default_netmask_length
  allocation_max_netmask_length     = each.value.allocation_max_netmask_length
  allocation_min_netmask_length     = each.value.allocation_min_netmask_length
  allocation_resource_tags          = each.value.allocation_resource_tags
  auto_import                       = each.value.auto_import
  aws_service                       = each.value.aws_service
  cascade                           = each.value.cascade
  description                       = each.value.description
  locale                            = each.value.locale
  public_ip_source                  = each.value.public_ip_source
  publicly_advertisable             = each.value.publicly_advertisable
  region                            = each.value.region
  source_ipam_pool_id               = each.value.source_ipam_pool_id
  tags                              = each.value.tags
  tags_all                          = each.value.tags_all

  dynamic "source_resource" {
    for_each = each.value.source_resource != null ? each.value.source_resource : []
    content {
      resource_id     = source_resource.value.resource_id
      resource_owner  = source_resource.value.resource_owner
      resource_region = source_resource.value.resource_region
      resource_type   = source_resource.value.resource_type
    }
  }
}
