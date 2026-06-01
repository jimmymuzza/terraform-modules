resource "aws_dynamodb_global_secondary_index" "dynamodb_global_secondary_indexes" {
  for_each = var.dynamodb_global_secondary_indexes

  index_name      = each.value.index_name
  table_name      = each.value.table_name
  region          = each.value.region
  warm_throughput = each.value.warm_throughput

  dynamic "key_schema" {
    for_each = each.value.key_schema != null ? each.value.key_schema : []
    content {
      attribute_name = key_schema.value.attribute_name
      attribute_type = key_schema.value.attribute_type
      key_type       = key_schema.value.key_type
    }
  }

  dynamic "on_demand_throughput" {
    for_each = each.value.on_demand_throughput != null ? each.value.on_demand_throughput : []
    content {
      max_read_request_units  = on_demand_throughput.value.max_read_request_units
      max_write_request_units = on_demand_throughput.value.max_write_request_units
    }
  }

  dynamic "projection" {
    for_each = each.value.projection != null ? each.value.projection : []
    content {
      projection_type    = projection.value.projection_type
      non_key_attributes = projection.value.non_key_attributes
    }
  }

  dynamic "provisioned_throughput" {
    for_each = each.value.provisioned_throughput != null ? each.value.provisioned_throughput : []
    content {
      read_capacity_units  = provisioned_throughput.value.read_capacity_units
      write_capacity_units = provisioned_throughput.value.write_capacity_units
    }
  }
}
