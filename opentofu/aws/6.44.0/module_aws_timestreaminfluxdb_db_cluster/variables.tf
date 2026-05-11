variable "timestreaminfluxdb_db_clusters" {
  description = <<EOT
Map of timestreaminfluxdb_db_clusters, attributes below
Required:
    - db_instance_type
    - name
    - vpc_security_group_ids
    - vpc_subnet_ids
Optional:
    - allocated_storage
    - bucket
    - db_parameter_group_identifier
    - db_storage_type
    - deployment_type
    - failover_mode
    - network_type
    - organization
    - password
    - port
    - publicly_accessible
    - region
    - tags
    - username
    - log_delivery_configuration
    - maintenance_schedule
EOT

  type = map(object({
    db_instance_type              = string
    name                          = string
    vpc_security_group_ids        = set(string)
    vpc_subnet_ids                = set(string)
    allocated_storage             = optional(number)
    bucket                        = optional(string)
    db_parameter_group_identifier = optional(string)
    db_storage_type               = optional(string)
    deployment_type               = optional(string)
    failover_mode                 = optional(string)
    network_type                  = optional(string)
    organization                  = optional(string)
    password                      = optional(string)
    port                          = optional(number)
    publicly_accessible           = optional(bool)
    region                        = optional(string)
    tags                          = optional(map(string))
    username                      = optional(string)
    log_delivery_configuration    = optional(list(object({
            s3_configuration = optional(list(object({
                bucket_name = string
                enabled     = bool
            })))
        })))
    maintenance_schedule          = optional(list(object({
            preferred_maintenance_window = string
            timezone                     = string
        })))
  }))
}
