resource "aws_securityhub_insight" "securityhub_insights" {
  for_each = var.securityhub_insights

  group_by_attribute = each.value.group_by_attribute
  name               = each.value.name
  region             = each.value.region

  dynamic "filters" {
    for_each = each.value.filters != null ? each.value.filters : []
    content {

      dynamic "aws_account_id" {
        for_each = filters.value.aws_account_id != null ? filters.value.aws_account_id : []
        content {
          comparison = aws_account_id.value.comparison
          value      = aws_account_id.value.value
        }
      }

      dynamic "aws_account_name" {
        for_each = filters.value.aws_account_name != null ? filters.value.aws_account_name : []
        content {
          comparison = aws_account_name.value.comparison
          value      = aws_account_name.value.value
        }
      }

      dynamic "company_name" {
        for_each = filters.value.company_name != null ? filters.value.company_name : []
        content {
          comparison = company_name.value.comparison
          value      = company_name.value.value
        }
      }

      dynamic "compliance_associated_standards_id" {
        for_each = filters.value.compliance_associated_standards_id != null ? filters.value.compliance_associated_standards_id : []
        content {
          comparison = compliance_associated_standards_id.value.comparison
          value      = compliance_associated_standards_id.value.value
        }
      }

      dynamic "compliance_security_control_id" {
        for_each = filters.value.compliance_security_control_id != null ? filters.value.compliance_security_control_id : []
        content {
          comparison = compliance_security_control_id.value.comparison
          value      = compliance_security_control_id.value.value
        }
      }

      dynamic "compliance_security_control_parameters_name" {
        for_each = filters.value.compliance_security_control_parameters_name != null ? filters.value.compliance_security_control_parameters_name : []
        content {
          comparison = compliance_security_control_parameters_name.value.comparison
          value      = compliance_security_control_parameters_name.value.value
        }
      }

      dynamic "compliance_security_control_parameters_value" {
        for_each = filters.value.compliance_security_control_parameters_value != null ? filters.value.compliance_security_control_parameters_value : []
        content {
          comparison = compliance_security_control_parameters_value.value.comparison
          value      = compliance_security_control_parameters_value.value.value
        }
      }

      dynamic "compliance_status" {
        for_each = filters.value.compliance_status != null ? filters.value.compliance_status : []
        content {
          comparison = compliance_status.value.comparison
          value      = compliance_status.value.value
        }
      }

      dynamic "confidence" {
        for_each = filters.value.confidence != null ? filters.value.confidence : []
        content {
          eq  = confidence.value.eq
          gte = confidence.value.gte
          lte = confidence.value.lte
        }
      }

      dynamic "created_at" {
        for_each = filters.value.created_at != null ? filters.value.created_at : []
        content {
          end   = created_at.value.end
          start = created_at.value.start

          dynamic "date_range" {
            for_each = created_at.value.date_range != null ? created_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "criticality" {
        for_each = filters.value.criticality != null ? filters.value.criticality : []
        content {
          eq  = criticality.value.eq
          gte = criticality.value.gte
          lte = criticality.value.lte
        }
      }

      dynamic "description" {
        for_each = filters.value.description != null ? filters.value.description : []
        content {
          comparison = description.value.comparison
          value      = description.value.value
        }
      }

      dynamic "finding_provider_fields_confidence" {
        for_each = filters.value.finding_provider_fields_confidence != null ? filters.value.finding_provider_fields_confidence : []
        content {
          eq  = finding_provider_fields_confidence.value.eq
          gte = finding_provider_fields_confidence.value.gte
          lte = finding_provider_fields_confidence.value.lte
        }
      }

      dynamic "finding_provider_fields_criticality" {
        for_each = filters.value.finding_provider_fields_criticality != null ? filters.value.finding_provider_fields_criticality : []
        content {
          eq  = finding_provider_fields_criticality.value.eq
          gte = finding_provider_fields_criticality.value.gte
          lte = finding_provider_fields_criticality.value.lte
        }
      }

      dynamic "finding_provider_fields_related_findings_id" {
        for_each = filters.value.finding_provider_fields_related_findings_id != null ? filters.value.finding_provider_fields_related_findings_id : []
        content {
          comparison = finding_provider_fields_related_findings_id.value.comparison
          value      = finding_provider_fields_related_findings_id.value.value
        }
      }

      dynamic "finding_provider_fields_related_findings_product_arn" {
        for_each = filters.value.finding_provider_fields_related_findings_product_arn != null ? filters.value.finding_provider_fields_related_findings_product_arn : []
        content {
          comparison = finding_provider_fields_related_findings_product_arn.value.comparison
          value      = finding_provider_fields_related_findings_product_arn.value.value
        }
      }

      dynamic "finding_provider_fields_severity_label" {
        for_each = filters.value.finding_provider_fields_severity_label != null ? filters.value.finding_provider_fields_severity_label : []
        content {
          comparison = finding_provider_fields_severity_label.value.comparison
          value      = finding_provider_fields_severity_label.value.value
        }
      }

      dynamic "finding_provider_fields_severity_original" {
        for_each = filters.value.finding_provider_fields_severity_original != null ? filters.value.finding_provider_fields_severity_original : []
        content {
          comparison = finding_provider_fields_severity_original.value.comparison
          value      = finding_provider_fields_severity_original.value.value
        }
      }

      dynamic "finding_provider_fields_types" {
        for_each = filters.value.finding_provider_fields_types != null ? filters.value.finding_provider_fields_types : []
        content {
          comparison = finding_provider_fields_types.value.comparison
          value      = finding_provider_fields_types.value.value
        }
      }

      dynamic "first_observed_at" {
        for_each = filters.value.first_observed_at != null ? filters.value.first_observed_at : []
        content {
          end   = first_observed_at.value.end
          start = first_observed_at.value.start

          dynamic "date_range" {
            for_each = first_observed_at.value.date_range != null ? first_observed_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "generator_id" {
        for_each = filters.value.generator_id != null ? filters.value.generator_id : []
        content {
          comparison = generator_id.value.comparison
          value      = generator_id.value.value
        }
      }

      dynamic "id" {
        for_each = filters.value.id != null ? filters.value.id : []
        content {
          comparison = id.value.comparison
          value      = id.value.value
        }
      }

      dynamic "keyword" {
        for_each = filters.value.keyword != null ? filters.value.keyword : []
        content {
          value = keyword.value.value
        }
      }

      dynamic "last_observed_at" {
        for_each = filters.value.last_observed_at != null ? filters.value.last_observed_at : []
        content {
          end   = last_observed_at.value.end
          start = last_observed_at.value.start

          dynamic "date_range" {
            for_each = last_observed_at.value.date_range != null ? last_observed_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "malware_name" {
        for_each = filters.value.malware_name != null ? filters.value.malware_name : []
        content {
          comparison = malware_name.value.comparison
          value      = malware_name.value.value
        }
      }

      dynamic "malware_path" {
        for_each = filters.value.malware_path != null ? filters.value.malware_path : []
        content {
          comparison = malware_path.value.comparison
          value      = malware_path.value.value
        }
      }

      dynamic "malware_state" {
        for_each = filters.value.malware_state != null ? filters.value.malware_state : []
        content {
          comparison = malware_state.value.comparison
          value      = malware_state.value.value
        }
      }

      dynamic "malware_type" {
        for_each = filters.value.malware_type != null ? filters.value.malware_type : []
        content {
          comparison = malware_type.value.comparison
          value      = malware_type.value.value
        }
      }

      dynamic "network_destination_domain" {
        for_each = filters.value.network_destination_domain != null ? filters.value.network_destination_domain : []
        content {
          comparison = network_destination_domain.value.comparison
          value      = network_destination_domain.value.value
        }
      }

      dynamic "network_destination_ipv4" {
        for_each = filters.value.network_destination_ipv4 != null ? filters.value.network_destination_ipv4 : []
        content {
          cidr = network_destination_ipv4.value.cidr
        }
      }

      dynamic "network_destination_ipv6" {
        for_each = filters.value.network_destination_ipv6 != null ? filters.value.network_destination_ipv6 : []
        content {
          cidr = network_destination_ipv6.value.cidr
        }
      }

      dynamic "network_destination_port" {
        for_each = filters.value.network_destination_port != null ? filters.value.network_destination_port : []
        content {
          eq  = network_destination_port.value.eq
          gte = network_destination_port.value.gte
          lte = network_destination_port.value.lte
        }
      }

      dynamic "network_direction" {
        for_each = filters.value.network_direction != null ? filters.value.network_direction : []
        content {
          comparison = network_direction.value.comparison
          value      = network_direction.value.value
        }
      }

      dynamic "network_protocol" {
        for_each = filters.value.network_protocol != null ? filters.value.network_protocol : []
        content {
          comparison = network_protocol.value.comparison
          value      = network_protocol.value.value
        }
      }

      dynamic "network_source_domain" {
        for_each = filters.value.network_source_domain != null ? filters.value.network_source_domain : []
        content {
          comparison = network_source_domain.value.comparison
          value      = network_source_domain.value.value
        }
      }

      dynamic "network_source_ipv4" {
        for_each = filters.value.network_source_ipv4 != null ? filters.value.network_source_ipv4 : []
        content {
          cidr = network_source_ipv4.value.cidr
        }
      }

      dynamic "network_source_ipv6" {
        for_each = filters.value.network_source_ipv6 != null ? filters.value.network_source_ipv6 : []
        content {
          cidr = network_source_ipv6.value.cidr
        }
      }

      dynamic "network_source_mac" {
        for_each = filters.value.network_source_mac != null ? filters.value.network_source_mac : []
        content {
          comparison = network_source_mac.value.comparison
          value      = network_source_mac.value.value
        }
      }

      dynamic "network_source_port" {
        for_each = filters.value.network_source_port != null ? filters.value.network_source_port : []
        content {
          eq  = network_source_port.value.eq
          gte = network_source_port.value.gte
          lte = network_source_port.value.lte
        }
      }

      dynamic "note_text" {
        for_each = filters.value.note_text != null ? filters.value.note_text : []
        content {
          comparison = note_text.value.comparison
          value      = note_text.value.value
        }
      }

      dynamic "note_updated_at" {
        for_each = filters.value.note_updated_at != null ? filters.value.note_updated_at : []
        content {
          end   = note_updated_at.value.end
          start = note_updated_at.value.start

          dynamic "date_range" {
            for_each = note_updated_at.value.date_range != null ? note_updated_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "note_updated_by" {
        for_each = filters.value.note_updated_by != null ? filters.value.note_updated_by : []
        content {
          comparison = note_updated_by.value.comparison
          value      = note_updated_by.value.value
        }
      }

      dynamic "process_launched_at" {
        for_each = filters.value.process_launched_at != null ? filters.value.process_launched_at : []
        content {
          end   = process_launched_at.value.end
          start = process_launched_at.value.start

          dynamic "date_range" {
            for_each = process_launched_at.value.date_range != null ? process_launched_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "process_name" {
        for_each = filters.value.process_name != null ? filters.value.process_name : []
        content {
          comparison = process_name.value.comparison
          value      = process_name.value.value
        }
      }

      dynamic "process_parent_pid" {
        for_each = filters.value.process_parent_pid != null ? filters.value.process_parent_pid : []
        content {
          eq  = process_parent_pid.value.eq
          gte = process_parent_pid.value.gte
          lte = process_parent_pid.value.lte
        }
      }

      dynamic "process_path" {
        for_each = filters.value.process_path != null ? filters.value.process_path : []
        content {
          comparison = process_path.value.comparison
          value      = process_path.value.value
        }
      }

      dynamic "process_pid" {
        for_each = filters.value.process_pid != null ? filters.value.process_pid : []
        content {
          eq  = process_pid.value.eq
          gte = process_pid.value.gte
          lte = process_pid.value.lte
        }
      }

      dynamic "process_terminated_at" {
        for_each = filters.value.process_terminated_at != null ? filters.value.process_terminated_at : []
        content {
          end   = process_terminated_at.value.end
          start = process_terminated_at.value.start

          dynamic "date_range" {
            for_each = process_terminated_at.value.date_range != null ? process_terminated_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "product_arn" {
        for_each = filters.value.product_arn != null ? filters.value.product_arn : []
        content {
          comparison = product_arn.value.comparison
          value      = product_arn.value.value
        }
      }

      dynamic "product_fields" {
        for_each = filters.value.product_fields != null ? filters.value.product_fields : []
        content {
          comparison = product_fields.value.comparison
          key        = product_fields.value.key
          value      = product_fields.value.value
        }
      }

      dynamic "product_name" {
        for_each = filters.value.product_name != null ? filters.value.product_name : []
        content {
          comparison = product_name.value.comparison
          value      = product_name.value.value
        }
      }

      dynamic "recommendation_text" {
        for_each = filters.value.recommendation_text != null ? filters.value.recommendation_text : []
        content {
          comparison = recommendation_text.value.comparison
          value      = recommendation_text.value.value
        }
      }

      dynamic "record_state" {
        for_each = filters.value.record_state != null ? filters.value.record_state : []
        content {
          comparison = record_state.value.comparison
          value      = record_state.value.value
        }
      }

      dynamic "related_findings_id" {
        for_each = filters.value.related_findings_id != null ? filters.value.related_findings_id : []
        content {
          comparison = related_findings_id.value.comparison
          value      = related_findings_id.value.value
        }
      }

      dynamic "related_findings_product_arn" {
        for_each = filters.value.related_findings_product_arn != null ? filters.value.related_findings_product_arn : []
        content {
          comparison = related_findings_product_arn.value.comparison
          value      = related_findings_product_arn.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_iam_instance_profile_arn" {
        for_each = filters.value.resource_aws_ec2_instance_iam_instance_profile_arn != null ? filters.value.resource_aws_ec2_instance_iam_instance_profile_arn : []
        content {
          comparison = resource_aws_ec2_instance_iam_instance_profile_arn.value.comparison
          value      = resource_aws_ec2_instance_iam_instance_profile_arn.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_image_id" {
        for_each = filters.value.resource_aws_ec2_instance_image_id != null ? filters.value.resource_aws_ec2_instance_image_id : []
        content {
          comparison = resource_aws_ec2_instance_image_id.value.comparison
          value      = resource_aws_ec2_instance_image_id.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_ipv4_addresses" {
        for_each = filters.value.resource_aws_ec2_instance_ipv4_addresses != null ? filters.value.resource_aws_ec2_instance_ipv4_addresses : []
        content {
          cidr = resource_aws_ec2_instance_ipv4_addresses.value.cidr
        }
      }

      dynamic "resource_aws_ec2_instance_ipv6_addresses" {
        for_each = filters.value.resource_aws_ec2_instance_ipv6_addresses != null ? filters.value.resource_aws_ec2_instance_ipv6_addresses : []
        content {
          cidr = resource_aws_ec2_instance_ipv6_addresses.value.cidr
        }
      }

      dynamic "resource_aws_ec2_instance_key_name" {
        for_each = filters.value.resource_aws_ec2_instance_key_name != null ? filters.value.resource_aws_ec2_instance_key_name : []
        content {
          comparison = resource_aws_ec2_instance_key_name.value.comparison
          value      = resource_aws_ec2_instance_key_name.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_launched_at" {
        for_each = filters.value.resource_aws_ec2_instance_launched_at != null ? filters.value.resource_aws_ec2_instance_launched_at : []
        content {
          end   = resource_aws_ec2_instance_launched_at.value.end
          start = resource_aws_ec2_instance_launched_at.value.start

          dynamic "date_range" {
            for_each = resource_aws_ec2_instance_launched_at.value.date_range != null ? resource_aws_ec2_instance_launched_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "resource_aws_ec2_instance_subnet_id" {
        for_each = filters.value.resource_aws_ec2_instance_subnet_id != null ? filters.value.resource_aws_ec2_instance_subnet_id : []
        content {
          comparison = resource_aws_ec2_instance_subnet_id.value.comparison
          value      = resource_aws_ec2_instance_subnet_id.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_type" {
        for_each = filters.value.resource_aws_ec2_instance_type != null ? filters.value.resource_aws_ec2_instance_type : []
        content {
          comparison = resource_aws_ec2_instance_type.value.comparison
          value      = resource_aws_ec2_instance_type.value.value
        }
      }

      dynamic "resource_aws_ec2_instance_vpc_id" {
        for_each = filters.value.resource_aws_ec2_instance_vpc_id != null ? filters.value.resource_aws_ec2_instance_vpc_id : []
        content {
          comparison = resource_aws_ec2_instance_vpc_id.value.comparison
          value      = resource_aws_ec2_instance_vpc_id.value.value
        }
      }

      dynamic "resource_aws_iam_access_key_created_at" {
        for_each = filters.value.resource_aws_iam_access_key_created_at != null ? filters.value.resource_aws_iam_access_key_created_at : []
        content {
          end   = resource_aws_iam_access_key_created_at.value.end
          start = resource_aws_iam_access_key_created_at.value.start

          dynamic "date_range" {
            for_each = resource_aws_iam_access_key_created_at.value.date_range != null ? resource_aws_iam_access_key_created_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "resource_aws_iam_access_key_status" {
        for_each = filters.value.resource_aws_iam_access_key_status != null ? filters.value.resource_aws_iam_access_key_status : []
        content {
          comparison = resource_aws_iam_access_key_status.value.comparison
          value      = resource_aws_iam_access_key_status.value.value
        }
      }

      dynamic "resource_aws_iam_access_key_user_name" {
        for_each = filters.value.resource_aws_iam_access_key_user_name != null ? filters.value.resource_aws_iam_access_key_user_name : []
        content {
          comparison = resource_aws_iam_access_key_user_name.value.comparison
          value      = resource_aws_iam_access_key_user_name.value.value
        }
      }

      dynamic "resource_aws_s3_bucket_owner_id" {
        for_each = filters.value.resource_aws_s3_bucket_owner_id != null ? filters.value.resource_aws_s3_bucket_owner_id : []
        content {
          comparison = resource_aws_s3_bucket_owner_id.value.comparison
          value      = resource_aws_s3_bucket_owner_id.value.value
        }
      }

      dynamic "resource_aws_s3_bucket_owner_name" {
        for_each = filters.value.resource_aws_s3_bucket_owner_name != null ? filters.value.resource_aws_s3_bucket_owner_name : []
        content {
          comparison = resource_aws_s3_bucket_owner_name.value.comparison
          value      = resource_aws_s3_bucket_owner_name.value.value
        }
      }

      dynamic "resource_container_image_id" {
        for_each = filters.value.resource_container_image_id != null ? filters.value.resource_container_image_id : []
        content {
          comparison = resource_container_image_id.value.comparison
          value      = resource_container_image_id.value.value
        }
      }

      dynamic "resource_container_image_name" {
        for_each = filters.value.resource_container_image_name != null ? filters.value.resource_container_image_name : []
        content {
          comparison = resource_container_image_name.value.comparison
          value      = resource_container_image_name.value.value
        }
      }

      dynamic "resource_container_launched_at" {
        for_each = filters.value.resource_container_launched_at != null ? filters.value.resource_container_launched_at : []
        content {
          end   = resource_container_launched_at.value.end
          start = resource_container_launched_at.value.start

          dynamic "date_range" {
            for_each = resource_container_launched_at.value.date_range != null ? resource_container_launched_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "resource_container_name" {
        for_each = filters.value.resource_container_name != null ? filters.value.resource_container_name : []
        content {
          comparison = resource_container_name.value.comparison
          value      = resource_container_name.value.value
        }
      }

      dynamic "resource_details_other" {
        for_each = filters.value.resource_details_other != null ? filters.value.resource_details_other : []
        content {
          comparison = resource_details_other.value.comparison
          key        = resource_details_other.value.key
          value      = resource_details_other.value.value
        }
      }

      dynamic "resource_id" {
        for_each = filters.value.resource_id != null ? filters.value.resource_id : []
        content {
          comparison = resource_id.value.comparison
          value      = resource_id.value.value
        }
      }

      dynamic "resource_partition" {
        for_each = filters.value.resource_partition != null ? filters.value.resource_partition : []
        content {
          comparison = resource_partition.value.comparison
          value      = resource_partition.value.value
        }
      }

      dynamic "resource_region" {
        for_each = filters.value.resource_region != null ? filters.value.resource_region : []
        content {
          comparison = resource_region.value.comparison
          value      = resource_region.value.value
        }
      }

      dynamic "resource_tags" {
        for_each = filters.value.resource_tags != null ? filters.value.resource_tags : []
        content {
          comparison = resource_tags.value.comparison
          key        = resource_tags.value.key
          value      = resource_tags.value.value
        }
      }

      dynamic "resource_type" {
        for_each = filters.value.resource_type != null ? filters.value.resource_type : []
        content {
          comparison = resource_type.value.comparison
          value      = resource_type.value.value
        }
      }

      dynamic "severity_label" {
        for_each = filters.value.severity_label != null ? filters.value.severity_label : []
        content {
          comparison = severity_label.value.comparison
          value      = severity_label.value.value
        }
      }

      dynamic "source_url" {
        for_each = filters.value.source_url != null ? filters.value.source_url : []
        content {
          comparison = source_url.value.comparison
          value      = source_url.value.value
        }
      }

      dynamic "threat_intel_indicator_category" {
        for_each = filters.value.threat_intel_indicator_category != null ? filters.value.threat_intel_indicator_category : []
        content {
          comparison = threat_intel_indicator_category.value.comparison
          value      = threat_intel_indicator_category.value.value
        }
      }

      dynamic "threat_intel_indicator_last_observed_at" {
        for_each = filters.value.threat_intel_indicator_last_observed_at != null ? filters.value.threat_intel_indicator_last_observed_at : []
        content {
          end   = threat_intel_indicator_last_observed_at.value.end
          start = threat_intel_indicator_last_observed_at.value.start

          dynamic "date_range" {
            for_each = threat_intel_indicator_last_observed_at.value.date_range != null ? threat_intel_indicator_last_observed_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "threat_intel_indicator_source" {
        for_each = filters.value.threat_intel_indicator_source != null ? filters.value.threat_intel_indicator_source : []
        content {
          comparison = threat_intel_indicator_source.value.comparison
          value      = threat_intel_indicator_source.value.value
        }
      }

      dynamic "threat_intel_indicator_source_url" {
        for_each = filters.value.threat_intel_indicator_source_url != null ? filters.value.threat_intel_indicator_source_url : []
        content {
          comparison = threat_intel_indicator_source_url.value.comparison
          value      = threat_intel_indicator_source_url.value.value
        }
      }

      dynamic "threat_intel_indicator_type" {
        for_each = filters.value.threat_intel_indicator_type != null ? filters.value.threat_intel_indicator_type : []
        content {
          comparison = threat_intel_indicator_type.value.comparison
          value      = threat_intel_indicator_type.value.value
        }
      }

      dynamic "threat_intel_indicator_value" {
        for_each = filters.value.threat_intel_indicator_value != null ? filters.value.threat_intel_indicator_value : []
        content {
          comparison = threat_intel_indicator_value.value.comparison
          value      = threat_intel_indicator_value.value.value
        }
      }

      dynamic "title" {
        for_each = filters.value.title != null ? filters.value.title : []
        content {
          comparison = title.value.comparison
          value      = title.value.value
        }
      }

      dynamic "type" {
        for_each = filters.value.type != null ? filters.value.type : []
        content {
          comparison = type.value.comparison
          value      = type.value.value
        }
      }

      dynamic "updated_at" {
        for_each = filters.value.updated_at != null ? filters.value.updated_at : []
        content {
          end   = updated_at.value.end
          start = updated_at.value.start

          dynamic "date_range" {
            for_each = updated_at.value.date_range != null ? updated_at.value.date_range : []
            content {
              unit  = date_range.value.unit
              value = date_range.value.value
            }
          }
        }
      }

      dynamic "user_defined_values" {
        for_each = filters.value.user_defined_values != null ? filters.value.user_defined_values : []
        content {
          comparison = user_defined_values.value.comparison
          key        = user_defined_values.value.key
          value      = user_defined_values.value.value
        }
      }

      dynamic "verification_state" {
        for_each = filters.value.verification_state != null ? filters.value.verification_state : []
        content {
          comparison = verification_state.value.comparison
          value      = verification_state.value.value
        }
      }

      dynamic "workflow_status" {
        for_each = filters.value.workflow_status != null ? filters.value.workflow_status : []
        content {
          comparison = workflow_status.value.comparison
          value      = workflow_status.value.value
        }
      }
    }
  }
}
