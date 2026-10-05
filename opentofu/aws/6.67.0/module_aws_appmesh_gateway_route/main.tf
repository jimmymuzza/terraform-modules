resource "aws_appmesh_gateway_route" "appmesh_gateway_routes" {
  for_each = var.appmesh_gateway_routes

  mesh_name            = each.value.mesh_name
  name                 = each.value.name
  virtual_gateway_name = each.value.virtual_gateway_name
  mesh_owner           = each.value.mesh_owner
  region               = each.value.region
  tags                 = each.value.tags
  tags_all             = each.value.tags_all

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

              dynamic "target" {
                for_each = action.value.target != null ? action.value.target : []
                content {
                  port = target.value.port

                  dynamic "virtual_service" {
                    for_each = target.value.virtual_service != null ? target.value.virtual_service : []
                    content {
                      virtual_service_name = virtual_service.value.virtual_service_name
                    }
                  }
                }
              }
            }
          }

          dynamic "match" {
            for_each = grpc_route.value.match != null ? grpc_route.value.match : []
            content {
              service_name = match.value.service_name
              port         = match.value.port
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

              dynamic "rewrite" {
                for_each = action.value.rewrite != null ? action.value.rewrite : []
                content {

                  dynamic "hostname" {
                    for_each = rewrite.value.hostname != null ? rewrite.value.hostname : []
                    content {
                      default_target_hostname = hostname.value.default_target_hostname
                    }
                  }

                  dynamic "path" {
                    for_each = rewrite.value.path != null ? rewrite.value.path : []
                    content {
                      exact = path.value.exact
                    }
                  }

                  dynamic "prefix" {
                    for_each = rewrite.value.prefix != null ? rewrite.value.prefix : []
                    content {
                      default_prefix = prefix.value.default_prefix
                      value          = prefix.value.value
                    }
                  }
                }
              }

              dynamic "target" {
                for_each = action.value.target != null ? action.value.target : []
                content {
                  port = target.value.port

                  dynamic "virtual_service" {
                    for_each = target.value.virtual_service != null ? target.value.virtual_service : []
                    content {
                      virtual_service_name = virtual_service.value.virtual_service_name
                    }
                  }
                }
              }
            }
          }

          dynamic "match" {
            for_each = http2_route.value.match != null ? http2_route.value.match : []
            content {
              port   = match.value.port
              prefix = match.value.prefix

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

              dynamic "hostname" {
                for_each = match.value.hostname != null ? match.value.hostname : []
                content {
                  exact  = hostname.value.exact
                  suffix = hostname.value.suffix
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
        }
      }

      dynamic "http_route" {
        for_each = spec.value.http_route != null ? spec.value.http_route : []
        content {

          dynamic "action" {
            for_each = http_route.value.action != null ? http_route.value.action : []
            content {

              dynamic "rewrite" {
                for_each = action.value.rewrite != null ? action.value.rewrite : []
                content {

                  dynamic "hostname" {
                    for_each = rewrite.value.hostname != null ? rewrite.value.hostname : []
                    content {
                      default_target_hostname = hostname.value.default_target_hostname
                    }
                  }

                  dynamic "path" {
                    for_each = rewrite.value.path != null ? rewrite.value.path : []
                    content {
                      exact = path.value.exact
                    }
                  }

                  dynamic "prefix" {
                    for_each = rewrite.value.prefix != null ? rewrite.value.prefix : []
                    content {
                      default_prefix = prefix.value.default_prefix
                      value          = prefix.value.value
                    }
                  }
                }
              }

              dynamic "target" {
                for_each = action.value.target != null ? action.value.target : []
                content {
                  port = target.value.port

                  dynamic "virtual_service" {
                    for_each = target.value.virtual_service != null ? target.value.virtual_service : []
                    content {
                      virtual_service_name = virtual_service.value.virtual_service_name
                    }
                  }
                }
              }
            }
          }

          dynamic "match" {
            for_each = http_route.value.match != null ? http_route.value.match : []
            content {
              port   = match.value.port
              prefix = match.value.prefix

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

              dynamic "hostname" {
                for_each = match.value.hostname != null ? match.value.hostname : []
                content {
                  exact  = hostname.value.exact
                  suffix = hostname.value.suffix
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
        }
      }
    }
  }
}
