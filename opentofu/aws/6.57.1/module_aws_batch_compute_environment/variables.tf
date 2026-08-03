variable "batch_compute_environments" {
  description = <<EOT
Map of batch_compute_environments, attributes below
Required:
    - type
Optional:
    - name
    - name_prefix
    - region
    - service_role
    - state
    - tags
    - tags_all
    - compute_resources
    - eks_configuration
    - update_policy
EOT

  type = map(object({
    type              = string
    name              = optional(string)
    name_prefix       = optional(string)
    region            = optional(string)
    service_role      = optional(string)
    state             = optional(string)
    tags              = optional(map(string))
    tags_all          = optional(map(string))
    compute_resources = optional(list(object({
            max_vcpus           = number
            subnets             = set(string)
            type                = string
            allocation_strategy = optional(string)
            bid_percentage      = optional(number)
            desired_vcpus       = optional(number)
            ec2_key_pair        = optional(string)
            image_id            = optional(string)
            instance_role       = optional(string)
            instance_type       = optional(set(string))
            min_vcpus           = optional(number)
            placement_group     = optional(string)
            security_group_ids  = optional(set(string))
            spot_iam_fleet_role = optional(string)
            tags                = optional(map(string))
            ec2_configuration   = optional(list(object({
                image_id_override        = optional(string)
                image_kubernetes_version = optional(string)
                image_type               = optional(string)
            })))
            launch_template     = optional(list(object({
                launch_template_id   = optional(string)
                launch_template_name = optional(string)
                version              = optional(string)
            })))
        })))
    eks_configuration = optional(list(object({
            eks_cluster_arn      = string
            kubernetes_namespace = string
        })))
    update_policy     = optional(list(object({
            job_execution_timeout_minutes = optional(number)
            terminate_jobs_on_update      = optional(bool)
        })))
  }))
}
