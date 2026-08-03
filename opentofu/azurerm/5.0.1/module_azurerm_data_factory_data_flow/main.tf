resource "azurerm_data_factory_data_flow" "data_factory_data_flows" {
  for_each = var.data_factory_data_flows

  data_factory_id = each.value.data_factory_id
  name            = each.value.name
  annotations     = each.value.annotations
  description     = each.value.description
  folder          = each.value.folder
  script          = each.value.script
  script_lines    = each.value.script_lines

  dynamic "sink" {
    for_each = each.value.sink != null ? each.value.sink : []
    content {
      name        = sink.value.name
      description = sink.value.description

      dynamic "dataset" {
        for_each = sink.value.dataset != null ? sink.value.dataset : []
        content {
          name       = dataset.value.name
          parameters = dataset.value.parameters
        }
      }

      dynamic "flowlet" {
        for_each = sink.value.flowlet != null ? sink.value.flowlet : []
        content {
          name               = flowlet.value.name
          dataset_parameters = flowlet.value.dataset_parameters
          parameters         = flowlet.value.parameters
        }
      }

      dynamic "linked_service" {
        for_each = sink.value.linked_service != null ? sink.value.linked_service : []
        content {
          name       = linked_service.value.name
          parameters = linked_service.value.parameters
        }
      }

      dynamic "rejected_linked_service" {
        for_each = sink.value.rejected_linked_service != null ? sink.value.rejected_linked_service : []
        content {
          name       = rejected_linked_service.value.name
          parameters = rejected_linked_service.value.parameters
        }
      }

      dynamic "schema_linked_service" {
        for_each = sink.value.schema_linked_service != null ? sink.value.schema_linked_service : []
        content {
          name       = schema_linked_service.value.name
          parameters = schema_linked_service.value.parameters
        }
      }
    }
  }

  dynamic "source" {
    for_each = each.value.source != null ? each.value.source : []
    content {
      name        = source.value.name
      description = source.value.description

      dynamic "dataset" {
        for_each = source.value.dataset != null ? source.value.dataset : []
        content {
          name       = dataset.value.name
          parameters = dataset.value.parameters
        }
      }

      dynamic "flowlet" {
        for_each = source.value.flowlet != null ? source.value.flowlet : []
        content {
          name               = flowlet.value.name
          dataset_parameters = flowlet.value.dataset_parameters
          parameters         = flowlet.value.parameters
        }
      }

      dynamic "linked_service" {
        for_each = source.value.linked_service != null ? source.value.linked_service : []
        content {
          name       = linked_service.value.name
          parameters = linked_service.value.parameters
        }
      }

      dynamic "rejected_linked_service" {
        for_each = source.value.rejected_linked_service != null ? source.value.rejected_linked_service : []
        content {
          name       = rejected_linked_service.value.name
          parameters = rejected_linked_service.value.parameters
        }
      }

      dynamic "schema_linked_service" {
        for_each = source.value.schema_linked_service != null ? source.value.schema_linked_service : []
        content {
          name       = schema_linked_service.value.name
          parameters = schema_linked_service.value.parameters
        }
      }
    }
  }

  dynamic "transformation" {
    for_each = each.value.transformation != null ? each.value.transformation : []
    content {
      name        = transformation.value.name
      description = transformation.value.description

      dynamic "dataset" {
        for_each = transformation.value.dataset != null ? transformation.value.dataset : []
        content {
          name       = dataset.value.name
          parameters = dataset.value.parameters
        }
      }

      dynamic "flowlet" {
        for_each = transformation.value.flowlet != null ? transformation.value.flowlet : []
        content {
          name               = flowlet.value.name
          dataset_parameters = flowlet.value.dataset_parameters
          parameters         = flowlet.value.parameters
        }
      }

      dynamic "linked_service" {
        for_each = transformation.value.linked_service != null ? transformation.value.linked_service : []
        content {
          name       = linked_service.value.name
          parameters = linked_service.value.parameters
        }
      }
    }
  }
}
