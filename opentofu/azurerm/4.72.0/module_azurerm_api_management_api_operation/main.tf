resource "azurerm_api_management_api_operation" "api_management_api_operations" {
  for_each = var.api_management_api_operations

  api_management_name = each.value.api_management_name
  api_name            = each.value.api_name
  display_name        = each.value.display_name
  method              = each.value.method
  operation_id        = each.value.operation_id
  resource_group_name = each.value.resource_group_name
  url_template        = each.value.url_template
  description         = each.value.description

  dynamic "request" {
    for_each = each.value.request != null ? each.value.request : []
    content {
      description = request.value.description

      dynamic "header" {
        for_each = request.value.header != null ? request.value.header : []
        content {
          name          = header.value.name
          required      = header.value.required
          type          = header.value.type
          default_value = header.value.default_value
          description   = header.value.description
          schema_id     = header.value.schema_id
          type_name     = header.value.type_name
          values        = header.value.values

          dynamic "example" {
            for_each = header.value.example != null ? header.value.example : []
            content {
              name           = example.value.name
              description    = example.value.description
              external_value = example.value.external_value
              summary        = example.value.summary
              value          = example.value.value
            }
          }
        }
      }

      dynamic "query_parameter" {
        for_each = request.value.query_parameter != null ? request.value.query_parameter : []
        content {
          name          = query_parameter.value.name
          required      = query_parameter.value.required
          type          = query_parameter.value.type
          default_value = query_parameter.value.default_value
          description   = query_parameter.value.description
          schema_id     = query_parameter.value.schema_id
          type_name     = query_parameter.value.type_name
          values        = query_parameter.value.values

          dynamic "example" {
            for_each = query_parameter.value.example != null ? query_parameter.value.example : []
            content {
              name           = example.value.name
              description    = example.value.description
              external_value = example.value.external_value
              summary        = example.value.summary
              value          = example.value.value
            }
          }
        }
      }

      dynamic "representation" {
        for_each = request.value.representation != null ? request.value.representation : []
        content {
          content_type = representation.value.content_type
          schema_id    = representation.value.schema_id
          type_name    = representation.value.type_name

          dynamic "example" {
            for_each = representation.value.example != null ? representation.value.example : []
            content {
              name           = example.value.name
              description    = example.value.description
              external_value = example.value.external_value
              summary        = example.value.summary
              value          = example.value.value
            }
          }

          dynamic "form_parameter" {
            for_each = representation.value.form_parameter != null ? representation.value.form_parameter : []
            content {
              name          = form_parameter.value.name
              required      = form_parameter.value.required
              type          = form_parameter.value.type
              default_value = form_parameter.value.default_value
              description   = form_parameter.value.description
              schema_id     = form_parameter.value.schema_id
              type_name     = form_parameter.value.type_name
              values        = form_parameter.value.values

              dynamic "example" {
                for_each = form_parameter.value.example != null ? form_parameter.value.example : []
                content {
                  name           = example.value.name
                  description    = example.value.description
                  external_value = example.value.external_value
                  summary        = example.value.summary
                  value          = example.value.value
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "response" {
    for_each = each.value.response != null ? each.value.response : []
    content {
      status_code = response.value.status_code
      description = response.value.description

      dynamic "header" {
        for_each = response.value.header != null ? response.value.header : []
        content {
          name          = header.value.name
          required      = header.value.required
          type          = header.value.type
          default_value = header.value.default_value
          description   = header.value.description
          schema_id     = header.value.schema_id
          type_name     = header.value.type_name
          values        = header.value.values

          dynamic "example" {
            for_each = header.value.example != null ? header.value.example : []
            content {
              name           = example.value.name
              description    = example.value.description
              external_value = example.value.external_value
              summary        = example.value.summary
              value          = example.value.value
            }
          }
        }
      }

      dynamic "representation" {
        for_each = response.value.representation != null ? response.value.representation : []
        content {
          content_type = representation.value.content_type
          schema_id    = representation.value.schema_id
          type_name    = representation.value.type_name

          dynamic "example" {
            for_each = representation.value.example != null ? representation.value.example : []
            content {
              name           = example.value.name
              description    = example.value.description
              external_value = example.value.external_value
              summary        = example.value.summary
              value          = example.value.value
            }
          }

          dynamic "form_parameter" {
            for_each = representation.value.form_parameter != null ? representation.value.form_parameter : []
            content {
              name          = form_parameter.value.name
              required      = form_parameter.value.required
              type          = form_parameter.value.type
              default_value = form_parameter.value.default_value
              description   = form_parameter.value.description
              schema_id     = form_parameter.value.schema_id
              type_name     = form_parameter.value.type_name
              values        = form_parameter.value.values

              dynamic "example" {
                for_each = form_parameter.value.example != null ? form_parameter.value.example : []
                content {
                  name           = example.value.name
                  description    = example.value.description
                  external_value = example.value.external_value
                  summary        = example.value.summary
                  value          = example.value.value
                }
              }
            }
          }
        }
      }
    }
  }

  dynamic "template_parameter" {
    for_each = each.value.template_parameter != null ? each.value.template_parameter : []
    content {
      name          = template_parameter.value.name
      required      = template_parameter.value.required
      type          = template_parameter.value.type
      default_value = template_parameter.value.default_value
      description   = template_parameter.value.description
      schema_id     = template_parameter.value.schema_id
      type_name     = template_parameter.value.type_name
      values        = template_parameter.value.values

      dynamic "example" {
        for_each = template_parameter.value.example != null ? template_parameter.value.example : []
        content {
          name           = example.value.name
          description    = example.value.description
          external_value = example.value.external_value
          summary        = example.value.summary
          value          = example.value.value
        }
      }
    }
  }
}
