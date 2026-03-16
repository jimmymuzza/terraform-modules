variable "appmesh_virtual_nodes" {
  description = <<EOT
Map of appmesh_virtual_nodes, attributes below
Required:
    - mesh_name
    - name
    - spec
Optional:
    - mesh_owner
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    mesh_name  = string
    name       = string
    mesh_owner = optional(string)
    region     = optional(string)
    tags       = optional(map(string))
    tags_all   = optional(map(string))
    spec       = list(object({
            backend           = optional(set(object({
                virtual_service = list(object({
                    virtual_service_name = string
                    client_policy        = optional(list(object({
                        tls = optional(list(object({
                            enforce     = optional(bool)
                            ports       = optional(set(number))
                            certificate = optional(list(object({
                                file = optional(list(object({
                                    certificate_chain = string
                                    private_key       = string
                                })))
                                sds  = optional(list(object({
                                    secret_name = string
                                })))
                            })))
                            validation  = list(object({
                                subject_alternative_names = optional(list(object({
                                    match = list(object({
                                        exact = set(string)
                                    }))
                                })))
                                trust                     = list(object({
                                    acm  = optional(list(object({
                                        certificate_authority_arns = set(string)
                                    })))
                                    file = optional(list(object({
                                        certificate_chain = string
                                    })))
                                    sds  = optional(list(object({
                                        secret_name = string
                                    })))
                                }))
                            }))
                        })))
                    })))
                }))
            })))
            backend_defaults  = optional(list(object({
                client_policy = optional(list(object({
                    tls = optional(list(object({
                        enforce     = optional(bool)
                        ports       = optional(set(number))
                        certificate = optional(list(object({
                            file = optional(list(object({
                                certificate_chain = string
                                private_key       = string
                            })))
                            sds  = optional(list(object({
                                secret_name = string
                            })))
                        })))
                        validation  = list(object({
                            subject_alternative_names = optional(list(object({
                                match = list(object({
                                    exact = set(string)
                                }))
                            })))
                            trust                     = list(object({
                                acm  = optional(list(object({
                                    certificate_authority_arns = set(string)
                                })))
                                file = optional(list(object({
                                    certificate_chain = string
                                })))
                                sds  = optional(list(object({
                                    secret_name = string
                                })))
                            }))
                        }))
                    })))
                })))
            })))
            listener          = optional(list(object({
                connection_pool   = optional(list(object({
                    grpc  = optional(list(object({
                        max_requests = number
                    })))
                    http  = optional(list(object({
                        max_connections      = number
                        max_pending_requests = optional(number)
                    })))
                    http2 = optional(list(object({
                        max_requests = number
                    })))
                    tcp   = optional(list(object({
                        max_connections = number
                    })))
                })))
                health_check      = optional(list(object({
                    healthy_threshold   = number
                    interval_millis     = number
                    protocol            = string
                    timeout_millis      = number
                    unhealthy_threshold = number
                    path                = optional(string)
                    port                = optional(number)
                })))
                outlier_detection = optional(list(object({
                    max_ejection_percent   = number
                    max_server_errors      = number
                    base_ejection_duration = list(object({
                        unit  = string
                        value = number
                    }))
                    interval               = list(object({
                        unit  = string
                        value = number
                    }))
                })))
                port_mapping      = list(object({
                    port     = number
                    protocol = string
                }))
                timeout           = optional(list(object({
                    grpc  = optional(list(object({
                        idle        = optional(list(object({
                            unit  = string
                            value = number
                        })))
                        per_request = optional(list(object({
                            unit  = string
                            value = number
                        })))
                    })))
                    http  = optional(list(object({
                        idle        = optional(list(object({
                            unit  = string
                            value = number
                        })))
                        per_request = optional(list(object({
                            unit  = string
                            value = number
                        })))
                    })))
                    http2 = optional(list(object({
                        idle        = optional(list(object({
                            unit  = string
                            value = number
                        })))
                        per_request = optional(list(object({
                            unit  = string
                            value = number
                        })))
                    })))
                    tcp   = optional(list(object({
                        idle = optional(list(object({
                            unit  = string
                            value = number
                        })))
                    })))
                })))
                tls               = optional(list(object({
                    mode        = string
                    certificate = list(object({
                        acm  = optional(list(object({
                            certificate_arn = string
                        })))
                        file = optional(list(object({
                            certificate_chain = string
                            private_key       = string
                        })))
                        sds  = optional(list(object({
                            secret_name = string
                        })))
                    }))
                    validation  = optional(list(object({
                        subject_alternative_names = optional(list(object({
                            match = list(object({
                                exact = set(string)
                            }))
                        })))
                        trust                     = list(object({
                            file = optional(list(object({
                                certificate_chain = string
                            })))
                            sds  = optional(list(object({
                                secret_name = string
                            })))
                        }))
                    })))
                })))
            })))
            logging           = optional(list(object({
                access_log = optional(list(object({
                    file = optional(list(object({
                        path   = string
                        format = optional(list(object({
                            text = optional(string)
                            json = optional(list(object({
                                key   = string
                                value = string
                            })))
                        })))
                    })))
                })))
            })))
            service_discovery = optional(list(object({
                aws_cloud_map = optional(list(object({
                    namespace_name = string
                    service_name   = string
                    attributes     = optional(map(string))
                })))
                dns           = optional(list(object({
                    hostname      = string
                    ip_preference = optional(string)
                    response_type = optional(string)
                })))
            })))
        }))
  }))
}
