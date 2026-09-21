variable "appmesh_routes" {
  description = <<EOT
Map of appmesh_routes, attributes below
Required:
    - mesh_name
    - name
    - virtual_router_name
    - spec
Optional:
    - mesh_owner
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    mesh_name           = string
    name                = string
    virtual_router_name = string
    mesh_owner          = optional(string)
    region              = optional(string)
    tags                = optional(map(string))
    tags_all            = optional(map(string))
    spec                = list(object({
            priority    = optional(number)
            grpc_route  = optional(list(object({
                action       = list(object({
                    weighted_target = set(object({
                        virtual_node = string
                        weight       = number
                        port         = optional(number)
                    }))
                }))
                match        = optional(list(object({
                    method_name  = optional(string)
                    port         = optional(number)
                    prefix       = optional(string)
                    service_name = optional(string)
                    metadata     = optional(set(object({
                        name   = string
                        invert = optional(bool)
                        match  = optional(list(object({
                            exact  = optional(string)
                            prefix = optional(string)
                            regex  = optional(string)
                            suffix = optional(string)
                            range  = optional(list(object({
                                end   = number
                                start = number
                            })))
                        })))
                    })))
                })))
                retry_policy = optional(list(object({
                    max_retries       = number
                    grpc_retry_events = optional(set(string))
                    http_retry_events = optional(set(string))
                    tcp_retry_events  = optional(set(string))
                    per_retry_timeout = list(object({
                        unit  = string
                        value = number
                    }))
                })))
                timeout      = optional(list(object({
                    idle        = optional(list(object({
                        unit  = string
                        value = number
                    })))
                    per_request = optional(list(object({
                        unit  = string
                        value = number
                    })))
                })))
            })))
            http2_route = optional(list(object({
                action       = list(object({
                    weighted_target = set(object({
                        virtual_node = string
                        weight       = number
                        port         = optional(number)
                    }))
                }))
                match        = list(object({
                    method          = optional(string)
                    port            = optional(number)
                    prefix          = optional(string)
                    scheme          = optional(string)
                    header          = optional(set(object({
                        name   = string
                        invert = optional(bool)
                        match  = optional(list(object({
                            exact  = optional(string)
                            prefix = optional(string)
                            regex  = optional(string)
                            suffix = optional(string)
                            range  = optional(list(object({
                                end   = number
                                start = number
                            })))
                        })))
                    })))
                    path            = optional(list(object({
                        exact = optional(string)
                        regex = optional(string)
                    })))
                    query_parameter = optional(set(object({
                        name  = string
                        match = optional(list(object({
                            exact = optional(string)
                        })))
                    })))
                }))
                retry_policy = optional(list(object({
                    max_retries       = number
                    http_retry_events = optional(set(string))
                    tcp_retry_events  = optional(set(string))
                    per_retry_timeout = list(object({
                        unit  = string
                        value = number
                    }))
                })))
                timeout      = optional(list(object({
                    idle        = optional(list(object({
                        unit  = string
                        value = number
                    })))
                    per_request = optional(list(object({
                        unit  = string
                        value = number
                    })))
                })))
            })))
            http_route  = optional(list(object({
                action       = list(object({
                    weighted_target = set(object({
                        virtual_node = string
                        weight       = number
                        port         = optional(number)
                    }))
                }))
                match        = list(object({
                    method          = optional(string)
                    port            = optional(number)
                    prefix          = optional(string)
                    scheme          = optional(string)
                    header          = optional(set(object({
                        name   = string
                        invert = optional(bool)
                        match  = optional(list(object({
                            exact  = optional(string)
                            prefix = optional(string)
                            regex  = optional(string)
                            suffix = optional(string)
                            range  = optional(list(object({
                                end   = number
                                start = number
                            })))
                        })))
                    })))
                    path            = optional(list(object({
                        exact = optional(string)
                        regex = optional(string)
                    })))
                    query_parameter = optional(set(object({
                        name  = string
                        match = optional(list(object({
                            exact = optional(string)
                        })))
                    })))
                }))
                retry_policy = optional(list(object({
                    max_retries       = number
                    http_retry_events = optional(set(string))
                    tcp_retry_events  = optional(set(string))
                    per_retry_timeout = list(object({
                        unit  = string
                        value = number
                    }))
                })))
                timeout      = optional(list(object({
                    idle        = optional(list(object({
                        unit  = string
                        value = number
                    })))
                    per_request = optional(list(object({
                        unit  = string
                        value = number
                    })))
                })))
            })))
            tcp_route   = optional(list(object({
                action  = list(object({
                    weighted_target = set(object({
                        virtual_node = string
                        weight       = number
                        port         = optional(number)
                    }))
                }))
                match   = optional(list(object({
                    port = optional(number)
                })))
                timeout = optional(list(object({
                    idle = optional(list(object({
                        unit  = string
                        value = number
                    })))
                })))
            })))
        }))
  }))
}
