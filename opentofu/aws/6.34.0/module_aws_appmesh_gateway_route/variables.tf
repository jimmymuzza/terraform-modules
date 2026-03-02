variable "appmesh_gateway_routes" {
  description = <<EOT
Map of appmesh_gateway_routes, attributes below
Required:
    - mesh_name
    - name
    - virtual_gateway_name
    - spec
Optional:
    - mesh_owner
    - region
    - tags
    - tags_all
EOT

  type = map(object({
    mesh_name            = string
    name                 = string
    virtual_gateway_name = string
    mesh_owner           = optional(string)
    region               = optional(string)
    tags                 = optional(map(string))
    tags_all             = optional(map(string))
    spec                 = list(object({
            priority    = optional(number)
            grpc_route  = optional(list(object({
                action = list(object({
                    target = list(object({
                        port            = optional(number)
                        virtual_service = list(object({
                            virtual_service_name = string
                        }))
                    }))
                }))
                match  = list(object({
                    service_name = string
                    port         = optional(number)
                }))
            })))
            http2_route = optional(list(object({
                action = list(object({
                    rewrite = optional(list(object({
                        hostname = optional(list(object({
                            default_target_hostname = string
                        })))
                        path     = optional(list(object({
                            exact = string
                        })))
                        prefix   = optional(list(object({
                            default_prefix = optional(string)
                            value          = optional(string)
                        })))
                    })))
                    target  = list(object({
                        port            = optional(number)
                        virtual_service = list(object({
                            virtual_service_name = string
                        }))
                    }))
                }))
                match  = list(object({
                    port            = optional(number)
                    prefix          = optional(string)
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
                    hostname        = optional(list(object({
                        exact  = optional(string)
                        suffix = optional(string)
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
            })))
            http_route  = optional(list(object({
                action = list(object({
                    rewrite = optional(list(object({
                        hostname = optional(list(object({
                            default_target_hostname = string
                        })))
                        path     = optional(list(object({
                            exact = string
                        })))
                        prefix   = optional(list(object({
                            default_prefix = optional(string)
                            value          = optional(string)
                        })))
                    })))
                    target  = list(object({
                        port            = optional(number)
                        virtual_service = list(object({
                            virtual_service_name = string
                        }))
                    }))
                }))
                match  = list(object({
                    port            = optional(number)
                    prefix          = optional(string)
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
                    hostname        = optional(list(object({
                        exact  = optional(string)
                        suffix = optional(string)
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
            })))
        }))
  }))
}
