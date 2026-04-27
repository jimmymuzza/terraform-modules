resource "aws_appmesh_virtual_node" "appmesh_virtual_nodes" {
  for_each = var.appmesh_virtual_nodes

  mesh_name  = each.value.mesh_name
  name       = each.value.name
  mesh_owner = each.value.mesh_owner
  region     = each.value.region
  tags       = each.value.tags
  tags_all   = each.value.tags_all

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {

      dynamic "backend" {
        for_each = spec.value.backend != null ? spec.value.backend : []
        content {

          dynamic "virtual_service" {
            for_each = backend.value.virtual_service != null ? backend.value.virtual_service : []
            content {
              virtual_service_name = virtual_service.value.virtual_service_name

              dynamic "client_policy" {
                for_each = virtual_service.value.client_policy != null ? virtual_service.value.client_policy : []
                content {

                  dynamic "tls" {
                    for_each = client_policy.value.tls != null ? client_policy.value.tls : []
                    content {
                      enforce = tls.value.enforce
                      ports   = tls.value.ports

                      dynamic "certificate" {
                        for_each = tls.value.certificate != null ? tls.value.certificate : []
                        content {

                          dynamic "file" {
                            for_each = certificate.value.file != null ? certificate.value.file : []
                            content {
                              certificate_chain = file.value.certificate_chain
                              private_key       = file.value.private_key
                            }
                          }

                          dynamic "sds" {
                            for_each = certificate.value.sds != null ? certificate.value.sds : []
                            content {
                              secret_name = sds.value.secret_name
                            }
                          }
                        }
                      }

                      dynamic "validation" {
                        for_each = tls.value.validation != null ? tls.value.validation : []
                        content {

                          dynamic "subject_alternative_names" {
                            for_each = validation.value.subject_alternative_names != null ? validation.value.subject_alternative_names : []
                            content {

                              dynamic "match" {
                                for_each = subject_alternative_names.value.match != null ? subject_alternative_names.value.match : []
                                content {
                                  exact = match.value.exact
                                }
                              }
                            }
                          }

                          dynamic "trust" {
                            for_each = validation.value.trust != null ? validation.value.trust : []
                            content {

                              dynamic "acm" {
                                for_each = trust.value.acm != null ? trust.value.acm : []
                                content {
                                  certificate_authority_arns = acm.value.certificate_authority_arns
                                }
                              }

                              dynamic "file" {
                                for_each = trust.value.file != null ? trust.value.file : []
                                content {
                                  certificate_chain = file.value.certificate_chain
                                }
                              }

                              dynamic "sds" {
                                for_each = trust.value.sds != null ? trust.value.sds : []
                                content {
                                  secret_name = sds.value.secret_name
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
          }
        }
      }

      dynamic "backend_defaults" {
        for_each = spec.value.backend_defaults != null ? spec.value.backend_defaults : []
        content {

          dynamic "client_policy" {
            for_each = backend_defaults.value.client_policy != null ? backend_defaults.value.client_policy : []
            content {

              dynamic "tls" {
                for_each = client_policy.value.tls != null ? client_policy.value.tls : []
                content {
                  enforce = tls.value.enforce
                  ports   = tls.value.ports

                  dynamic "certificate" {
                    for_each = tls.value.certificate != null ? tls.value.certificate : []
                    content {

                      dynamic "file" {
                        for_each = certificate.value.file != null ? certificate.value.file : []
                        content {
                          certificate_chain = file.value.certificate_chain
                          private_key       = file.value.private_key
                        }
                      }

                      dynamic "sds" {
                        for_each = certificate.value.sds != null ? certificate.value.sds : []
                        content {
                          secret_name = sds.value.secret_name
                        }
                      }
                    }
                  }

                  dynamic "validation" {
                    for_each = tls.value.validation != null ? tls.value.validation : []
                    content {

                      dynamic "subject_alternative_names" {
                        for_each = validation.value.subject_alternative_names != null ? validation.value.subject_alternative_names : []
                        content {

                          dynamic "match" {
                            for_each = subject_alternative_names.value.match != null ? subject_alternative_names.value.match : []
                            content {
                              exact = match.value.exact
                            }
                          }
                        }
                      }

                      dynamic "trust" {
                        for_each = validation.value.trust != null ? validation.value.trust : []
                        content {

                          dynamic "acm" {
                            for_each = trust.value.acm != null ? trust.value.acm : []
                            content {
                              certificate_authority_arns = acm.value.certificate_authority_arns
                            }
                          }

                          dynamic "file" {
                            for_each = trust.value.file != null ? trust.value.file : []
                            content {
                              certificate_chain = file.value.certificate_chain
                            }
                          }

                          dynamic "sds" {
                            for_each = trust.value.sds != null ? trust.value.sds : []
                            content {
                              secret_name = sds.value.secret_name
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
      }

      dynamic "listener" {
        for_each = spec.value.listener != null ? spec.value.listener : []
        content {

          dynamic "connection_pool" {
            for_each = listener.value.connection_pool != null ? listener.value.connection_pool : []
            content {

              dynamic "grpc" {
                for_each = connection_pool.value.grpc != null ? connection_pool.value.grpc : []
                content {
                  max_requests = grpc.value.max_requests
                }
              }

              dynamic "http" {
                for_each = connection_pool.value.http != null ? connection_pool.value.http : []
                content {
                  max_connections      = http.value.max_connections
                  max_pending_requests = http.value.max_pending_requests
                }
              }

              dynamic "http2" {
                for_each = connection_pool.value.http2 != null ? connection_pool.value.http2 : []
                content {
                  max_requests = http2.value.max_requests
                }
              }

              dynamic "tcp" {
                for_each = connection_pool.value.tcp != null ? connection_pool.value.tcp : []
                content {
                  max_connections = tcp.value.max_connections
                }
              }
            }
          }

          dynamic "health_check" {
            for_each = listener.value.health_check != null ? listener.value.health_check : []
            content {
              healthy_threshold   = health_check.value.healthy_threshold
              interval_millis     = health_check.value.interval_millis
              protocol            = health_check.value.protocol
              timeout_millis      = health_check.value.timeout_millis
              unhealthy_threshold = health_check.value.unhealthy_threshold
              path                = health_check.value.path
              port                = health_check.value.port
            }
          }

          dynamic "outlier_detection" {
            for_each = listener.value.outlier_detection != null ? listener.value.outlier_detection : []
            content {
              max_ejection_percent = outlier_detection.value.max_ejection_percent
              max_server_errors    = outlier_detection.value.max_server_errors

              dynamic "base_ejection_duration" {
                for_each = outlier_detection.value.base_ejection_duration != null ? outlier_detection.value.base_ejection_duration : []
                content {
                  unit  = base_ejection_duration.value.unit
                  value = base_ejection_duration.value.value
                }
              }

              dynamic "interval" {
                for_each = outlier_detection.value.interval != null ? outlier_detection.value.interval : []
                content {
                  unit  = interval.value.unit
                  value = interval.value.value
                }
              }
            }
          }

          dynamic "port_mapping" {
            for_each = listener.value.port_mapping != null ? listener.value.port_mapping : []
            content {
              port     = port_mapping.value.port
              protocol = port_mapping.value.protocol
            }
          }

          dynamic "timeout" {
            for_each = listener.value.timeout != null ? listener.value.timeout : []
            content {

              dynamic "grpc" {
                for_each = timeout.value.grpc != null ? timeout.value.grpc : []
                content {

                  dynamic "idle" {
                    for_each = grpc.value.idle != null ? grpc.value.idle : []
                    content {
                      unit  = idle.value.unit
                      value = idle.value.value
                    }
                  }

                  dynamic "per_request" {
                    for_each = grpc.value.per_request != null ? grpc.value.per_request : []
                    content {
                      unit  = per_request.value.unit
                      value = per_request.value.value
                    }
                  }
                }
              }

              dynamic "http" {
                for_each = timeout.value.http != null ? timeout.value.http : []
                content {

                  dynamic "idle" {
                    for_each = http.value.idle != null ? http.value.idle : []
                    content {
                      unit  = idle.value.unit
                      value = idle.value.value
                    }
                  }

                  dynamic "per_request" {
                    for_each = http.value.per_request != null ? http.value.per_request : []
                    content {
                      unit  = per_request.value.unit
                      value = per_request.value.value
                    }
                  }
                }
              }

              dynamic "http2" {
                for_each = timeout.value.http2 != null ? timeout.value.http2 : []
                content {

                  dynamic "idle" {
                    for_each = http2.value.idle != null ? http2.value.idle : []
                    content {
                      unit  = idle.value.unit
                      value = idle.value.value
                    }
                  }

                  dynamic "per_request" {
                    for_each = http2.value.per_request != null ? http2.value.per_request : []
                    content {
                      unit  = per_request.value.unit
                      value = per_request.value.value
                    }
                  }
                }
              }

              dynamic "tcp" {
                for_each = timeout.value.tcp != null ? timeout.value.tcp : []
                content {

                  dynamic "idle" {
                    for_each = tcp.value.idle != null ? tcp.value.idle : []
                    content {
                      unit  = idle.value.unit
                      value = idle.value.value
                    }
                  }
                }
              }
            }
          }

          dynamic "tls" {
            for_each = listener.value.tls != null ? listener.value.tls : []
            content {
              mode = tls.value.mode

              dynamic "certificate" {
                for_each = tls.value.certificate != null ? tls.value.certificate : []
                content {

                  dynamic "acm" {
                    for_each = certificate.value.acm != null ? certificate.value.acm : []
                    content {
                      certificate_arn = acm.value.certificate_arn
                    }
                  }

                  dynamic "file" {
                    for_each = certificate.value.file != null ? certificate.value.file : []
                    content {
                      certificate_chain = file.value.certificate_chain
                      private_key       = file.value.private_key
                    }
                  }

                  dynamic "sds" {
                    for_each = certificate.value.sds != null ? certificate.value.sds : []
                    content {
                      secret_name = sds.value.secret_name
                    }
                  }
                }
              }

              dynamic "validation" {
                for_each = tls.value.validation != null ? tls.value.validation : []
                content {

                  dynamic "subject_alternative_names" {
                    for_each = validation.value.subject_alternative_names != null ? validation.value.subject_alternative_names : []
                    content {

                      dynamic "match" {
                        for_each = subject_alternative_names.value.match != null ? subject_alternative_names.value.match : []
                        content {
                          exact = match.value.exact
                        }
                      }
                    }
                  }

                  dynamic "trust" {
                    for_each = validation.value.trust != null ? validation.value.trust : []
                    content {

                      dynamic "file" {
                        for_each = trust.value.file != null ? trust.value.file : []
                        content {
                          certificate_chain = file.value.certificate_chain
                        }
                      }

                      dynamic "sds" {
                        for_each = trust.value.sds != null ? trust.value.sds : []
                        content {
                          secret_name = sds.value.secret_name
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

      dynamic "logging" {
        for_each = spec.value.logging != null ? spec.value.logging : []
        content {

          dynamic "access_log" {
            for_each = logging.value.access_log != null ? logging.value.access_log : []
            content {

              dynamic "file" {
                for_each = access_log.value.file != null ? access_log.value.file : []
                content {
                  path = file.value.path

                  dynamic "format" {
                    for_each = file.value.format != null ? file.value.format : []
                    content {
                      text = format.value.text

                      dynamic "json" {
                        for_each = format.value.json != null ? format.value.json : []
                        content {
                          key   = json.value.key
                          value = json.value.value
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

      dynamic "service_discovery" {
        for_each = spec.value.service_discovery != null ? spec.value.service_discovery : []
        content {

          dynamic "aws_cloud_map" {
            for_each = service_discovery.value.aws_cloud_map != null ? service_discovery.value.aws_cloud_map : []
            content {
              namespace_name = aws_cloud_map.value.namespace_name
              service_name   = aws_cloud_map.value.service_name
              attributes     = aws_cloud_map.value.attributes
            }
          }

          dynamic "dns" {
            for_each = service_discovery.value.dns != null ? service_discovery.value.dns : []
            content {
              hostname      = dns.value.hostname
              ip_preference = dns.value.ip_preference
              response_type = dns.value.response_type
            }
          }
        }
      }
    }
  }
}
