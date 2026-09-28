resource "aws_s3control_multi_region_access_point_routes" "s3control_multi_region_access_point_routes" {
  for_each = var.s3control_multi_region_access_point_routes

  mrap       = each.value.mrap
  account_id = each.value.account_id
  region     = each.value.region

  dynamic "route" {
    for_each = each.value.route != null ? each.value.route : []
    content {
      bucket                  = route.value.bucket
      region                  = route.value.region
      traffic_dial_percentage = route.value.traffic_dial_percentage
    }
  }
}
