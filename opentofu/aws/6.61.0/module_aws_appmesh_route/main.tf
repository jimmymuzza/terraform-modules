resource "aws_appmesh_route" "appmesh_routes" {
  for_each = var.appmesh_routes

  mesh_name           = each.value.mesh_name
  name                = each.value.name
  virtual_router_name = each.value.virtual_router_name
  mesh_owner          = each.value.mesh_owner
  region              = each.value.region
  tags                = each.value.tags
  tags_all            = each.value.tags_all

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      priority = spec.value.priority

      dynamic "grpc_route" {
        for_each = spec.value.grpc_route != null ? spec.value.grpc_route : []
        content {

          dynamic "action" {
            for_each = grpc_route.value.action != null ? grpc_route.value.action : []
            content {

              dynamic "weighted_target" {
                for_each = action.value.weighted_target != null ? action.value.weighted_target : []
                content {
                  virtual_node = weighted_target.value.virtual_node
                  weight       = weighted_target.value.weight
                  port         = weighted_target.value.port
                }
              }
            }
          }

          dynamic "match" {
            for_each = grpc_route.value.match != null ? grpc_route.value.match : []
            content {
              method_name  = match.value.method_name
              port         = match.value.port
              prefix       = match.value.prefix
              service_name = match.value.service_name

              dynamic "metadata" {
                for_each = match.value.metadata != null ? match.value.metadata : []
                content {
                  name   = metadata.value.name
                  invert = metadata.value.invert

                  dynamic "match" {
                    for_each = metadata.value.match != null ? metadata.value.match : []
                    content {
                      exact  = match.value.exact
                      prefix = match.value.prefix
                      regex  = match.value.regex
                      suffix = match.value.suffix

                      dynamic "range" {
                        for_each = match.value.range != null ? match.value.range : []
                        content {
                          end   = range.value.end
                          start = range.value.start
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          dynamic "retry_policy" {
            for_each = grpc_route.value.retry_policy != null ? grpc_route.value.retry_policy : []
            content {
              max_retries       = retry_policy.value.max_retries
              grpc_retry_events = retry_policy.value.grpc_retry_events
              http_retry_events = retry_policy.value.http_retry_events
              tcp_retry_events  = retry_policy.value.tcp_retry_events

              dynamic "per_retry_timeout" {
                for_each = retry_policy.value.per_retry_timeout != null ? retry_policy.value.per_retry_timeout : []
                content {
                  unit  = per_retry_timeout.value.unit
                  value = per_retry_timeout.value.value
                }
              }
            }
          }

          dynamic "timeout" {
            for_each = grpc_route.value.timeout != null ? grpc_route.value.timeout : []
            content {

              dynamic "idle" {
                for_each = timeout.value.idle != null ? timeout.value.idle : []
                content {
                  unit  = idle.value.unit
                  value = idle.value.value
                }
              }

              dynamic "per_request" {
                for_each = timeout.value.per_request != null ? timeout.value.per_request : []
                content {
                  unit  = per_request.value.unit
                  value = per_request.value.value
                }
              }
            }
          }
        }
      }

      dynamic "http2_route" {
        for_each = spec.value.http2_route != null ? spec.value.http2_route : []
        content {

          dynamic "action" {
            for_each = http2_route.value.action != null ? http2_route.value.action : []
            content {

              dynamic "weighted_target" {
                for_each = action.value.weighted_target != null ? action.value.weighted_target : []
                content {
                  virtual_node = weighted_target.value.virtual_node
                  weight       = weighted_target.value.weight
                  port         = weighted_target.value.port
                }
              }
            }
          }

          dynamic "match" {
            for_each = http2_route.value.match != null ? http2_route.value.match : []
            content {
              method = match.value.method
              port   = match.value.port
              prefix = match.value.prefix
              scheme = match.value.scheme

              dynamic "header" {
                for_each = match.value.header != null ? match.value.header : []
                content {
                  name   = header.value.name
                  invert = header.value.invert

                  dynamic "match" {
                    for_each = header.value.match != null ? header.value.match : []
                    content {
                      exact  = match.value.exact
                      prefix = match.value.prefix
                      regex  = match.value.regex
                      suffix = match.value.suffix

                      dynamic "range" {
                        for_each = match.value.range != null ? match.value.range : []
                        content {
                          end   = range.value.end
                          start = range.value.start
                        }
                      }
                    }
                  }
                }
              }

              dynamic "path" {
                for_each = match.value.path != null ? match.value.path : []
                content {
                  exact = path.value.exact
                  regex = path.value.regex
                }
              }

              dynamic "query_parameter" {
                for_each = match.value.query_parameter != null ? match.value.query_parameter : []
                content {
                  name = query_parameter.value.name

                  dynamic "match" {
                    for_each = query_parameter.value.match != null ? query_parameter.value.match : []
                    content {
                      exact = match.value.exact
                    }
                  }
                }
              }
            }
          }

          dynamic "retry_policy" {
            for_each = http2_route.value.retry_policy != null ? http2_route.value.retry_policy : []
            content {
              max_retries       = retry_policy.value.max_retries
              http_retry_events = retry_policy.value.http_retry_events
              tcp_retry_events  = retry_policy.value.tcp_retry_events

              dynamic "per_retry_timeout" {
                for_each = retry_policy.value.per_retry_timeout != null ? retry_policy.value.per_retry_timeout : []
                content {
                  unit  = per_retry_timeout.value.unit
                  value = per_retry_timeout.value.value
                }
              }
            }
          }

          dynamic "timeout" {
            for_each = http2_route.value.timeout != null ? http2_route.value.timeout : []
            content {

              dynamic "idle" {
                for_each = timeout.value.idle != null ? timeout.value.idle : []
                content {
                  unit  = idle.value.unit
                  value = idle.value.value
                }
              }

              dynamic "per_request" {
                for_each = timeout.value.per_request != null ? timeout.value.per_request : []
                content {
                  unit  = per_request.value.unit
                  value = per_request.value.value
                }
              }
            }
          }
        }
      }

      dynamic "http_route" {
        for_each = spec.value.http_route != null ? spec.value.http_route : []
        content {

          dynamic "action" {
            for_each = http_route.value.action != null ? http_route.value.action : []
            content {

              dynamic "weighted_target" {
                for_each = action.value.weighted_target != null ? action.value.weighted_target : []
                content {
                  virtual_node = weighted_target.value.virtual_node
                  weight       = weighted_target.value.weight
                  port         = weighted_target.value.port
                }
              }
            }
          }

          dynamic "match" {
            for_each = http_route.value.match != null ? http_route.value.match : []
            content {
              method = match.value.method
              port   = match.value.port
              prefix = match.value.prefix
              scheme = match.value.scheme

              dynamic "header" {
                for_each = match.value.header != null ? match.value.header : []
                content {
                  name   = header.value.name
                  invert = header.value.invert

                  dynamic "match" {
                    for_each = header.value.match != null ? header.value.match : []
                    content {
                      exact  = match.value.exact
                      prefix = match.value.prefix
                      regex  = match.value.regex
                      suffix = match.value.suffix

                      dynamic "range" {
                        for_each = match.value.range != null ? match.value.range : []
                        content {
                          end   = range.value.end
                          start = range.value.start
                        }
                      }
                    }
                  }
                }
              }

              dynamic "path" {
                for_each = match.value.path != null ? match.value.path : []
                content {
                  exact = path.value.exact
                  regex = path.value.regex
                }
              }

              dynamic "query_parameter" {
                for_each = match.value.query_parameter != null ? match.value.query_parameter : []
                content {
                  name = query_parameter.value.name

                  dynamic "match" {
                    for_each = query_parameter.value.match != null ? query_parameter.value.match : []
                    content {
                      exact = match.value.exact
                    }
                  }
                }
              }
            }
          }

          dynamic "retry_policy" {
            for_each = http_route.value.retry_policy != null ? http_route.value.retry_policy : []
            content {
              max_retries       = retry_policy.value.max_retries
              http_retry_events = retry_policy.value.http_retry_events
              tcp_retry_events  = retry_policy.value.tcp_retry_events

              dynamic "per_retry_timeout" {
                for_each = retry_policy.value.per_retry_timeout != null ? retry_policy.value.per_retry_timeout : []
                content {
                  unit  = per_retry_timeout.value.unit
                  value = per_retry_timeout.value.value
                }
              }
            }
          }

          dynamic "timeout" {
            for_each = http_route.value.timeout != null ? http_route.value.timeout : []
            content {

              dynamic "idle" {
                for_each = timeout.value.idle != null ? timeout.value.idle : []
                content {
                  unit  = idle.value.unit
                  value = idle.value.value
                }
              }

              dynamic "per_request" {
                for_each = timeout.value.per_request != null ? timeout.value.per_request : []
                content {
                  unit  = per_request.value.unit
                  value = per_request.value.value
                }
              }
            }
          }
        }
      }

      dynamic "tcp_route" {
        for_each = spec.value.tcp_route != null ? spec.value.tcp_route : []
        content {

          dynamic "action" {
            for_each = tcp_route.value.action != null ? tcp_route.value.action : []
            content {

              dynamic "weighted_target" {
                for_each = action.value.weighted_target != null ? action.value.weighted_target : []
                content {
                  virtual_node = weighted_target.value.virtual_node
                  weight       = weighted_target.value.weight
                  port         = weighted_target.value.port
                }
              }
            }
          }

          dynamic "match" {
            for_each = tcp_route.value.match != null ? tcp_route.value.match : []
            content {
              port = match.value.port
            }
          }

          dynamic "timeout" {
            for_each = tcp_route.value.timeout != null ? tcp_route.value.timeout : []
            content {

              dynamic "idle" {
                for_each = timeout.value.idle != null ? timeout.value.idle : []
                content {
                  unit  = idle.value.unit
                  value = idle.value.value
                }
              }
            }
          }
        }
      }
    }
  }
}
