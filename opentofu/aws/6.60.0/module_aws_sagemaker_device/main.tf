resource "aws_sagemaker_device" "sagemaker_devices" {
  for_each = var.sagemaker_devices

  device_fleet_name = each.value.device_fleet_name
  region            = each.value.region

  dynamic "device" {
    for_each = each.value.device != null ? each.value.device : []
    content {
      device_name    = device.value.device_name
      description    = device.value.description
      iot_thing_name = device.value.iot_thing_name
    }
  }
}
