resource "azurerm_api_management_api_diagnostic" "api_management_api_diagnostics" {
  for_each = var.api_management_api_diagnostics

  api_management_logger_id  = each.value.api_management_logger_id
  api_management_name       = each.value.api_management_name
  api_name                  = each.value.api_name
  identifier                = each.value.identifier
  resource_group_name       = each.value.resource_group_name
  always_log_errors         = each.value.always_log_errors
  http_correlation_protocol = each.value.http_correlation_protocol
  log_client_ip             = each.value.log_client_ip
  operation_name_format     = each.value.operation_name_format
  sampling_percentage       = each.value.sampling_percentage
  verbosity                 = each.value.verbosity

  dynamic "backend_request" {
    for_each = each.value.backend_request != null ? each.value.backend_request : []
    content {
      body_bytes     = backend_request.value.body_bytes
      headers_to_log = backend_request.value.headers_to_log

      dynamic "data_masking" {
        for_each = backend_request.value.data_masking != null ? backend_request.value.data_masking : []
        content {

          dynamic "headers" {
            for_each = data_masking.value.headers != null ? data_masking.value.headers : []
            content {
              mode  = headers.value.mode
              value = headers.value.value
            }
          }

          dynamic "query_params" {
            for_each = data_masking.value.query_params != null ? data_masking.value.query_params : []
            content {
              mode  = query_params.value.mode
              value = query_params.value.value
            }
          }
        }
      }
    }
  }

  dynamic "backend_response" {
    for_each = each.value.backend_response != null ? each.value.backend_response : []
    content {
      body_bytes     = backend_response.value.body_bytes
      headers_to_log = backend_response.value.headers_to_log

      dynamic "data_masking" {
        for_each = backend_response.value.data_masking != null ? backend_response.value.data_masking : []
        content {

          dynamic "headers" {
            for_each = data_masking.value.headers != null ? data_masking.value.headers : []
            content {
              mode  = headers.value.mode
              value = headers.value.value
            }
          }

          dynamic "query_params" {
            for_each = data_masking.value.query_params != null ? data_masking.value.query_params : []
            content {
              mode  = query_params.value.mode
              value = query_params.value.value
            }
          }
        }
      }
    }
  }

  dynamic "frontend_request" {
    for_each = each.value.frontend_request != null ? each.value.frontend_request : []
    content {
      body_bytes     = frontend_request.value.body_bytes
      headers_to_log = frontend_request.value.headers_to_log

      dynamic "data_masking" {
        for_each = frontend_request.value.data_masking != null ? frontend_request.value.data_masking : []
        content {

          dynamic "headers" {
            for_each = data_masking.value.headers != null ? data_masking.value.headers : []
            content {
              mode  = headers.value.mode
              value = headers.value.value
            }
          }

          dynamic "query_params" {
            for_each = data_masking.value.query_params != null ? data_masking.value.query_params : []
            content {
              mode  = query_params.value.mode
              value = query_params.value.value
            }
          }
        }
      }
    }
  }

  dynamic "frontend_response" {
    for_each = each.value.frontend_response != null ? each.value.frontend_response : []
    content {
      body_bytes     = frontend_response.value.body_bytes
      headers_to_log = frontend_response.value.headers_to_log

      dynamic "data_masking" {
        for_each = frontend_response.value.data_masking != null ? frontend_response.value.data_masking : []
        content {

          dynamic "headers" {
            for_each = data_masking.value.headers != null ? data_masking.value.headers : []
            content {
              mode  = headers.value.mode
              value = headers.value.value
            }
          }

          dynamic "query_params" {
            for_each = data_masking.value.query_params != null ? data_masking.value.query_params : []
            content {
              mode  = query_params.value.mode
              value = query_params.value.value
            }
          }
        }
      }
    }
  }
}
