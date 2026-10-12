variable "redshift_clusters" {
  description = <<EOT
Map of redshift_clusters, attributes below
Required:
    - cluster_identifier
    - node_type
Optional:
    - allow_version_upgrade
    - apply_immediately
    - aqua_configuration_status
    - automated_snapshot_retention_period
    - availability_zone
    - availability_zone_relocation_enabled
    - cluster_parameter_group_name
    - cluster_subnet_group_name
    - cluster_type
    - cluster_version
    - database_name
    - default_iam_role_arn
    - elastic_ip
    - encrypted
    - enhanced_vpc_routing
    - final_snapshot_identifier
    - iam_roles
    - kms_key_id
    - maintenance_track_name
    - manage_master_password
    - manual_snapshot_retention_period
    - master_password
    - master_password_secret_kms_key_id
    - master_password_wo
    - master_password_wo_version
    - master_username
    - multi_az
    - number_of_nodes
    - owner_account
    - port
    - preferred_maintenance_window
    - publicly_accessible
    - region
    - skip_final_snapshot
    - snapshot_arn
    - snapshot_cluster_identifier
    - snapshot_identifier
    - tags
    - tags_all
    - vpc_security_group_ids
EOT

  type = map(object({
    cluster_identifier                   = string
    node_type                            = string
    allow_version_upgrade                = optional(bool)
    apply_immediately                    = optional(bool)
    aqua_configuration_status            = optional(string)
    automated_snapshot_retention_period  = optional(number)
    availability_zone                    = optional(string)
    availability_zone_relocation_enabled = optional(bool)
    cluster_parameter_group_name         = optional(string)
    cluster_subnet_group_name            = optional(string)
    cluster_type                         = optional(string)
    cluster_version                      = optional(string)
    database_name                        = optional(string)
    default_iam_role_arn                 = optional(string)
    elastic_ip                           = optional(string)
    encrypted                            = optional(string)
    enhanced_vpc_routing                 = optional(bool)
    final_snapshot_identifier            = optional(string)
    iam_roles                            = optional(set(string))
    kms_key_id                           = optional(string)
    maintenance_track_name               = optional(string)
    manage_master_password               = optional(bool)
    manual_snapshot_retention_period     = optional(number)
    master_password                      = optional(string)
    master_password_secret_kms_key_id    = optional(string)
    master_password_wo                   = optional(string)
    master_password_wo_version           = optional(number)
    master_username                      = optional(string)
    multi_az                             = optional(bool)
    number_of_nodes                      = optional(number)
    owner_account                        = optional(string)
    port                                 = optional(number)
    preferred_maintenance_window         = optional(string)
    publicly_accessible                  = optional(bool)
    region                               = optional(string)
    skip_final_snapshot                  = optional(bool)
    snapshot_arn                         = optional(string)
    snapshot_cluster_identifier          = optional(string)
    snapshot_identifier                  = optional(string)
    tags                                 = optional(map(string))
    tags_all                             = optional(map(string))
    vpc_security_group_ids               = optional(set(string))
  }))
}
