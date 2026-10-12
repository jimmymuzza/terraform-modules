resource "aws_inspector2_filter" "inspector2_filters" {
  for_each = var.inspector2_filters

  action      = each.value.action
  name        = each.value.name
  description = each.value.description
  reason      = each.value.reason
  region      = each.value.region
  tags        = each.value.tags

  dynamic "filter_criteria" {
    for_each = each.value.filter_criteria != null ? each.value.filter_criteria : []
    content {

      dynamic "aws_account_id" {
        for_each = filter_criteria.value.aws_account_id != null ? filter_criteria.value.aws_account_id : []
        content {
          comparison = aws_account_id.value.comparison
          value      = aws_account_id.value.value
        }
      }

      dynamic "code_repository_project_name" {
        for_each = filter_criteria.value.code_repository_project_name != null ? filter_criteria.value.code_repository_project_name : []
        content {
          comparison = code_repository_project_name.value.comparison
          value      = code_repository_project_name.value.value
        }
      }

      dynamic "code_repository_provider_type" {
        for_each = filter_criteria.value.code_repository_provider_type != null ? filter_criteria.value.code_repository_provider_type : []
        content {
          comparison = code_repository_provider_type.value.comparison
          value      = code_repository_provider_type.value.value
        }
      }

      dynamic "code_vulnerability_detector_name" {
        for_each = filter_criteria.value.code_vulnerability_detector_name != null ? filter_criteria.value.code_vulnerability_detector_name : []
        content {
          comparison = code_vulnerability_detector_name.value.comparison
          value      = code_vulnerability_detector_name.value.value
        }
      }

      dynamic "code_vulnerability_detector_tags" {
        for_each = filter_criteria.value.code_vulnerability_detector_tags != null ? filter_criteria.value.code_vulnerability_detector_tags : []
        content {
          comparison = code_vulnerability_detector_tags.value.comparison
          value      = code_vulnerability_detector_tags.value.value
        }
      }

      dynamic "code_vulnerability_file_path" {
        for_each = filter_criteria.value.code_vulnerability_file_path != null ? filter_criteria.value.code_vulnerability_file_path : []
        content {
          comparison = code_vulnerability_file_path.value.comparison
          value      = code_vulnerability_file_path.value.value
        }
      }

      dynamic "component_id" {
        for_each = filter_criteria.value.component_id != null ? filter_criteria.value.component_id : []
        content {
          comparison = component_id.value.comparison
          value      = component_id.value.value
        }
      }

      dynamic "component_type" {
        for_each = filter_criteria.value.component_type != null ? filter_criteria.value.component_type : []
        content {
          comparison = component_type.value.comparison
          value      = component_type.value.value
        }
      }

      dynamic "ec2_instance_image_id" {
        for_each = filter_criteria.value.ec2_instance_image_id != null ? filter_criteria.value.ec2_instance_image_id : []
        content {
          comparison = ec2_instance_image_id.value.comparison
          value      = ec2_instance_image_id.value.value
        }
      }

      dynamic "ec2_instance_subnet_id" {
        for_each = filter_criteria.value.ec2_instance_subnet_id != null ? filter_criteria.value.ec2_instance_subnet_id : []
        content {
          comparison = ec2_instance_subnet_id.value.comparison
          value      = ec2_instance_subnet_id.value.value
        }
      }

      dynamic "ec2_instance_vpc_id" {
        for_each = filter_criteria.value.ec2_instance_vpc_id != null ? filter_criteria.value.ec2_instance_vpc_id : []
        content {
          comparison = ec2_instance_vpc_id.value.comparison
          value      = ec2_instance_vpc_id.value.value
        }
      }

      dynamic "ecr_image_architecture" {
        for_each = filter_criteria.value.ecr_image_architecture != null ? filter_criteria.value.ecr_image_architecture : []
        content {
          comparison = ecr_image_architecture.value.comparison
          value      = ecr_image_architecture.value.value
        }
      }

      dynamic "ecr_image_hash" {
        for_each = filter_criteria.value.ecr_image_hash != null ? filter_criteria.value.ecr_image_hash : []
        content {
          comparison = ecr_image_hash.value.comparison
          value      = ecr_image_hash.value.value
        }
      }

      dynamic "ecr_image_in_use_count" {
        for_each = filter_criteria.value.ecr_image_in_use_count != null ? filter_criteria.value.ecr_image_in_use_count : []
        content {
          lower_inclusive = ecr_image_in_use_count.value.lower_inclusive
          upper_inclusive = ecr_image_in_use_count.value.upper_inclusive
        }
      }

      dynamic "ecr_image_last_in_use_at" {
        for_each = filter_criteria.value.ecr_image_last_in_use_at != null ? filter_criteria.value.ecr_image_last_in_use_at : []
        content {
          end_inclusive   = ecr_image_last_in_use_at.value.end_inclusive
          start_inclusive = ecr_image_last_in_use_at.value.start_inclusive
        }
      }

      dynamic "ecr_image_pushed_at" {
        for_each = filter_criteria.value.ecr_image_pushed_at != null ? filter_criteria.value.ecr_image_pushed_at : []
        content {
          end_inclusive   = ecr_image_pushed_at.value.end_inclusive
          start_inclusive = ecr_image_pushed_at.value.start_inclusive
        }
      }

      dynamic "ecr_image_registry" {
        for_each = filter_criteria.value.ecr_image_registry != null ? filter_criteria.value.ecr_image_registry : []
        content {
          comparison = ecr_image_registry.value.comparison
          value      = ecr_image_registry.value.value
        }
      }

      dynamic "ecr_image_repository_name" {
        for_each = filter_criteria.value.ecr_image_repository_name != null ? filter_criteria.value.ecr_image_repository_name : []
        content {
          comparison = ecr_image_repository_name.value.comparison
          value      = ecr_image_repository_name.value.value
        }
      }

      dynamic "ecr_image_tags" {
        for_each = filter_criteria.value.ecr_image_tags != null ? filter_criteria.value.ecr_image_tags : []
        content {
          comparison = ecr_image_tags.value.comparison
          value      = ecr_image_tags.value.value
        }
      }

      dynamic "epss_score" {
        for_each = filter_criteria.value.epss_score != null ? filter_criteria.value.epss_score : []
        content {
          lower_inclusive = epss_score.value.lower_inclusive
          upper_inclusive = epss_score.value.upper_inclusive
        }
      }

      dynamic "exploit_available" {
        for_each = filter_criteria.value.exploit_available != null ? filter_criteria.value.exploit_available : []
        content {
          comparison = exploit_available.value.comparison
          value      = exploit_available.value.value
        }
      }

      dynamic "finding_arn" {
        for_each = filter_criteria.value.finding_arn != null ? filter_criteria.value.finding_arn : []
        content {
          comparison = finding_arn.value.comparison
          value      = finding_arn.value.value
        }
      }

      dynamic "finding_status" {
        for_each = filter_criteria.value.finding_status != null ? filter_criteria.value.finding_status : []
        content {
          comparison = finding_status.value.comparison
          value      = finding_status.value.value
        }
      }

      dynamic "finding_type" {
        for_each = filter_criteria.value.finding_type != null ? filter_criteria.value.finding_type : []
        content {
          comparison = finding_type.value.comparison
          value      = finding_type.value.value
        }
      }

      dynamic "first_observed_at" {
        for_each = filter_criteria.value.first_observed_at != null ? filter_criteria.value.first_observed_at : []
        content {
          end_inclusive   = first_observed_at.value.end_inclusive
          start_inclusive = first_observed_at.value.start_inclusive
        }
      }

      dynamic "fix_available" {
        for_each = filter_criteria.value.fix_available != null ? filter_criteria.value.fix_available : []
        content {
          comparison = fix_available.value.comparison
          value      = fix_available.value.value
        }
      }

      dynamic "inspector_score" {
        for_each = filter_criteria.value.inspector_score != null ? filter_criteria.value.inspector_score : []
        content {
          lower_inclusive = inspector_score.value.lower_inclusive
          upper_inclusive = inspector_score.value.upper_inclusive
        }
      }

      dynamic "lambda_function_execution_role_arn" {
        for_each = filter_criteria.value.lambda_function_execution_role_arn != null ? filter_criteria.value.lambda_function_execution_role_arn : []
        content {
          comparison = lambda_function_execution_role_arn.value.comparison
          value      = lambda_function_execution_role_arn.value.value
        }
      }

      dynamic "lambda_function_last_modified_at" {
        for_each = filter_criteria.value.lambda_function_last_modified_at != null ? filter_criteria.value.lambda_function_last_modified_at : []
        content {
          end_inclusive   = lambda_function_last_modified_at.value.end_inclusive
          start_inclusive = lambda_function_last_modified_at.value.start_inclusive
        }
      }

      dynamic "lambda_function_layers" {
        for_each = filter_criteria.value.lambda_function_layers != null ? filter_criteria.value.lambda_function_layers : []
        content {
          comparison = lambda_function_layers.value.comparison
          value      = lambda_function_layers.value.value
        }
      }

      dynamic "lambda_function_name" {
        for_each = filter_criteria.value.lambda_function_name != null ? filter_criteria.value.lambda_function_name : []
        content {
          comparison = lambda_function_name.value.comparison
          value      = lambda_function_name.value.value
        }
      }

      dynamic "lambda_function_runtime" {
        for_each = filter_criteria.value.lambda_function_runtime != null ? filter_criteria.value.lambda_function_runtime : []
        content {
          comparison = lambda_function_runtime.value.comparison
          value      = lambda_function_runtime.value.value
        }
      }

      dynamic "last_observed_at" {
        for_each = filter_criteria.value.last_observed_at != null ? filter_criteria.value.last_observed_at : []
        content {
          end_inclusive   = last_observed_at.value.end_inclusive
          start_inclusive = last_observed_at.value.start_inclusive
        }
      }

      dynamic "network_protocol" {
        for_each = filter_criteria.value.network_protocol != null ? filter_criteria.value.network_protocol : []
        content {
          comparison = network_protocol.value.comparison
          value      = network_protocol.value.value
        }
      }

      dynamic "port_range" {
        for_each = filter_criteria.value.port_range != null ? filter_criteria.value.port_range : []
        content {
          begin_inclusive = port_range.value.begin_inclusive
          end_inclusive   = port_range.value.end_inclusive
        }
      }

      dynamic "related_vulnerabilities" {
        for_each = filter_criteria.value.related_vulnerabilities != null ? filter_criteria.value.related_vulnerabilities : []
        content {
          comparison = related_vulnerabilities.value.comparison
          value      = related_vulnerabilities.value.value
        }
      }

      dynamic "resource_id" {
        for_each = filter_criteria.value.resource_id != null ? filter_criteria.value.resource_id : []
        content {
          comparison = resource_id.value.comparison
          value      = resource_id.value.value
        }
      }

      dynamic "resource_tags" {
        for_each = filter_criteria.value.resource_tags != null ? filter_criteria.value.resource_tags : []
        content {
          comparison = resource_tags.value.comparison
          key        = resource_tags.value.key
          value      = resource_tags.value.value
        }
      }

      dynamic "resource_type" {
        for_each = filter_criteria.value.resource_type != null ? filter_criteria.value.resource_type : []
        content {
          comparison = resource_type.value.comparison
          value      = resource_type.value.value
        }
      }

      dynamic "severity" {
        for_each = filter_criteria.value.severity != null ? filter_criteria.value.severity : []
        content {
          comparison = severity.value.comparison
          value      = severity.value.value
        }
      }

      dynamic "title" {
        for_each = filter_criteria.value.title != null ? filter_criteria.value.title : []
        content {
          comparison = title.value.comparison
          value      = title.value.value
        }
      }

      dynamic "updated_at" {
        for_each = filter_criteria.value.updated_at != null ? filter_criteria.value.updated_at : []
        content {
          end_inclusive   = updated_at.value.end_inclusive
          start_inclusive = updated_at.value.start_inclusive
        }
      }

      dynamic "vendor_severity" {
        for_each = filter_criteria.value.vendor_severity != null ? filter_criteria.value.vendor_severity : []
        content {
          comparison = vendor_severity.value.comparison
          value      = vendor_severity.value.value
        }
      }

      dynamic "vulnerability_id" {
        for_each = filter_criteria.value.vulnerability_id != null ? filter_criteria.value.vulnerability_id : []
        content {
          comparison = vulnerability_id.value.comparison
          value      = vulnerability_id.value.value
        }
      }

      dynamic "vulnerability_source" {
        for_each = filter_criteria.value.vulnerability_source != null ? filter_criteria.value.vulnerability_source : []
        content {
          comparison = vulnerability_source.value.comparison
          value      = vulnerability_source.value.value
        }
      }

      dynamic "vulnerable_packages" {
        for_each = filter_criteria.value.vulnerable_packages != null ? filter_criteria.value.vulnerable_packages : []
        content {

          dynamic "architecture" {
            for_each = vulnerable_packages.value.architecture != null ? vulnerable_packages.value.architecture : []
            content {
              comparison = architecture.value.comparison
              value      = architecture.value.value
            }
          }

          dynamic "epoch" {
            for_each = vulnerable_packages.value.epoch != null ? vulnerable_packages.value.epoch : []
            content {
              lower_inclusive = epoch.value.lower_inclusive
              upper_inclusive = epoch.value.upper_inclusive
            }
          }

          dynamic "file_path" {
            for_each = vulnerable_packages.value.file_path != null ? vulnerable_packages.value.file_path : []
            content {
              comparison = file_path.value.comparison
              value      = file_path.value.value
            }
          }

          dynamic "name" {
            for_each = vulnerable_packages.value.name != null ? vulnerable_packages.value.name : []
            content {
              comparison = name.value.comparison
              value      = name.value.value
            }
          }

          dynamic "release" {
            for_each = vulnerable_packages.value.release != null ? vulnerable_packages.value.release : []
            content {
              comparison = release.value.comparison
              value      = release.value.value
            }
          }

          dynamic "source_lambda_layer_arn" {
            for_each = vulnerable_packages.value.source_lambda_layer_arn != null ? vulnerable_packages.value.source_lambda_layer_arn : []
            content {
              comparison = source_lambda_layer_arn.value.comparison
              value      = source_lambda_layer_arn.value.value
            }
          }

          dynamic "source_layer_hash" {
            for_each = vulnerable_packages.value.source_layer_hash != null ? vulnerable_packages.value.source_layer_hash : []
            content {
              comparison = source_layer_hash.value.comparison
              value      = source_layer_hash.value.value
            }
          }

          dynamic "version" {
            for_each = vulnerable_packages.value.version != null ? vulnerable_packages.value.version : []
            content {
              comparison = version.value.comparison
              value      = version.value.value
            }
          }
        }
      }
    }
  }
}
