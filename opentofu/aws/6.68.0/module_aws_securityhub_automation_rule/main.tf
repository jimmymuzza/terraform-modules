resource "aws_securityhub_automation_rule" "securityhub_automation_rules" {
  for_each = var.securityhub_automation_rules

  description = each.value.description
  rule_name   = each.value.rule_name
  rule_order  = each.value.rule_order
  is_terminal = each.value.is_terminal
  region      = each.value.region
  rule_status = each.value.rule_status
  tags        = each.value.tags

  dynamic "actions" {
    for_each = each.value.actions != null ? each.value.actions : []
    content {
      type = actions.value.type

      dynamic "finding_fields_update" {
        for_each = actions.value.finding_fields_update != null ? actions.value.finding_fields_update : []
        content {
          confidence          = finding_fields_update.value.confidence
          criticality         = finding_fields_update.value.criticality
          types               = finding_fields_update.value.types
          user_defined_fields = finding_fields_update.value.user_defined_fields
          verification_state  = finding_fields_update.value.verification_state

          dynamic "note" {
            for_each = finding_fields_update.value.note != null ? finding_fields_update.value.note : []
            content {
              text       = note.value.text
              updated_by = note.value.updated_by
            }
          }

          dynamic "related_findings" {
            for_each = finding_fields_update.value.related_findings != null ? finding_fields_update.value.related_findings : []
            content {
              product_arn = related_findings.value.product_arn
            }
          }

          dynamic "severity" {
            for_each = finding_fields_update.value.severity != null ? finding_fields_update.value.severity : []
            content {
              label   = severity.value.label
              product = severity.value.product
            }
          }

          dynamic "workflow" {
            for_each = finding_fields_update.value.workflow != null ? finding_fields_update.value.workflow : []
            content {
              status = workflow.value.status
            }
          }
        }
      }
    }
  }

  dynamic "criteria" {
    for_each = each.value.criteria != null ? each.value.criteria : []
    content {

      dynamic "aws_account_id" {
        for_each = criteria.value.aws_account_id != null ? criteria.value.aws_account_id : []
        content {
          comparison = aws_account_id.value.comparison
          value      = aws_account_id.value.value
        }
      }

      dynamic "aws_account_name" {
        for_each = criteria.value.aws_account_name != null ? criteria.value.aws_account_name : []
        content {
          comparison = aws_account_name.value.comparison
          value      = aws_account_name.value.value
        }
      }

      dynamic "company_name" {
        for_each = criteria.value.company_name != null ? criteria.value.company_name : []
        content {
          comparison = company_name.value.comparison
          value      = company_name.value.value
        }
      }

      dynamic "compliance_associated_standards_id" {
        for_each = criteria.value.compliance_associated_standards_id != null ? criteria.value.compliance_associated_standards_id : []
        content {
          comparison = compliance_associated_standards_id.value.comparison
          value      = compliance_associated_standards_id.value.value
        }
      }

      dynamic "compliance_security_control_id" {
        for_each = criteria.value.compliance_security_control_id != null ? criteria.value.compliance_security_control_id : []
        content {
          comparison = compliance_security_control_id.value.comparison
          value      = compliance_security_control_id.value.value
        }
      }

      dynamic "compliance_status" {
        for_each = criteria.value.compliance_status != null ? criteria.value.compliance_status : []
        content {
          comparison = compliance_status.value.comparison
          value      = compliance_status.value.value
        }
      }

      dynamic "confidence" {
        for_each = criteria.value.confidence != null ? criteria.value.confidence : []
        content {
          eq  = confidence.value.eq
          gt  = confidence.value.gt
          gte = confidence.value.gte
          lt  = confidence.value.lt
          lte = confidence.value.lte
        }
      }

      dynamic "created_at" {
        for_each = criteria.value.created_at != null ? criteria.value.created_at : []
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
        for_each = criteria.value.criticality != null ? criteria.value.criticality : []
        content {
          eq  = criticality.value.eq
          gt  = criticality.value.gt
          gte = criticality.value.gte
          lt  = criticality.value.lt
          lte = criticality.value.lte
        }
      }

      dynamic "description" {
        for_each = criteria.value.description != null ? criteria.value.description : []
        content {
          comparison = description.value.comparison
          value      = description.value.value
        }
      }

      dynamic "first_observed_at" {
        for_each = criteria.value.first_observed_at != null ? criteria.value.first_observed_at : []
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
        for_each = criteria.value.generator_id != null ? criteria.value.generator_id : []
        content {
          comparison = generator_id.value.comparison
          value      = generator_id.value.value
        }
      }

      dynamic "id" {
        for_each = criteria.value.id != null ? criteria.value.id : []
        content {
          comparison = id.value.comparison
          value      = id.value.value
        }
      }

      dynamic "last_observed_at" {
        for_each = criteria.value.last_observed_at != null ? criteria.value.last_observed_at : []
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

      dynamic "note_text" {
        for_each = criteria.value.note_text != null ? criteria.value.note_text : []
        content {
          comparison = note_text.value.comparison
          value      = note_text.value.value
        }
      }

      dynamic "note_updated_at" {
        for_each = criteria.value.note_updated_at != null ? criteria.value.note_updated_at : []
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
        for_each = criteria.value.note_updated_by != null ? criteria.value.note_updated_by : []
        content {
          comparison = note_updated_by.value.comparison
          value      = note_updated_by.value.value
        }
      }

      dynamic "product_arn" {
        for_each = criteria.value.product_arn != null ? criteria.value.product_arn : []
        content {
          comparison = product_arn.value.comparison
          value      = product_arn.value.value
        }
      }

      dynamic "product_name" {
        for_each = criteria.value.product_name != null ? criteria.value.product_name : []
        content {
          comparison = product_name.value.comparison
          value      = product_name.value.value
        }
      }

      dynamic "record_state" {
        for_each = criteria.value.record_state != null ? criteria.value.record_state : []
        content {
          comparison = record_state.value.comparison
          value      = record_state.value.value
        }
      }

      dynamic "related_findings_id" {
        for_each = criteria.value.related_findings_id != null ? criteria.value.related_findings_id : []
        content {
          comparison = related_findings_id.value.comparison
          value      = related_findings_id.value.value
        }
      }

      dynamic "related_findings_product_arn" {
        for_each = criteria.value.related_findings_product_arn != null ? criteria.value.related_findings_product_arn : []
        content {
          comparison = related_findings_product_arn.value.comparison
          value      = related_findings_product_arn.value.value
        }
      }

      dynamic "resource_application_arn" {
        for_each = criteria.value.resource_application_arn != null ? criteria.value.resource_application_arn : []
        content {
          comparison = resource_application_arn.value.comparison
          value      = resource_application_arn.value.value
        }
      }

      dynamic "resource_application_name" {
        for_each = criteria.value.resource_application_name != null ? criteria.value.resource_application_name : []
        content {
          comparison = resource_application_name.value.comparison
          value      = resource_application_name.value.value
        }
      }

      dynamic "resource_details_other" {
        for_each = criteria.value.resource_details_other != null ? criteria.value.resource_details_other : []
        content {
          comparison = resource_details_other.value.comparison
          key        = resource_details_other.value.key
          value      = resource_details_other.value.value
        }
      }

      dynamic "resource_id" {
        for_each = criteria.value.resource_id != null ? criteria.value.resource_id : []
        content {
          comparison = resource_id.value.comparison
          value      = resource_id.value.value
        }
      }

      dynamic "resource_partition" {
        for_each = criteria.value.resource_partition != null ? criteria.value.resource_partition : []
        content {
          comparison = resource_partition.value.comparison
          value      = resource_partition.value.value
        }
      }

      dynamic "resource_region" {
        for_each = criteria.value.resource_region != null ? criteria.value.resource_region : []
        content {
          comparison = resource_region.value.comparison
          value      = resource_region.value.value
        }
      }

      dynamic "resource_tags" {
        for_each = criteria.value.resource_tags != null ? criteria.value.resource_tags : []
        content {
          comparison = resource_tags.value.comparison
          key        = resource_tags.value.key
          value      = resource_tags.value.value
        }
      }

      dynamic "resource_type" {
        for_each = criteria.value.resource_type != null ? criteria.value.resource_type : []
        content {
          comparison = resource_type.value.comparison
          value      = resource_type.value.value
        }
      }

      dynamic "severity_label" {
        for_each = criteria.value.severity_label != null ? criteria.value.severity_label : []
        content {
          comparison = severity_label.value.comparison
          value      = severity_label.value.value
        }
      }

      dynamic "source_url" {
        for_each = criteria.value.source_url != null ? criteria.value.source_url : []
        content {
          comparison = source_url.value.comparison
          value      = source_url.value.value
        }
      }

      dynamic "title" {
        for_each = criteria.value.title != null ? criteria.value.title : []
        content {
          comparison = title.value.comparison
          value      = title.value.value
        }
      }

      dynamic "type" {
        for_each = criteria.value.type != null ? criteria.value.type : []
        content {
          comparison = type.value.comparison
          value      = type.value.value
        }
      }

      dynamic "updated_at" {
        for_each = criteria.value.updated_at != null ? criteria.value.updated_at : []
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

      dynamic "user_defined_fields" {
        for_each = criteria.value.user_defined_fields != null ? criteria.value.user_defined_fields : []
        content {
          comparison = user_defined_fields.value.comparison
          key        = user_defined_fields.value.key
          value      = user_defined_fields.value.value
        }
      }

      dynamic "verification_state" {
        for_each = criteria.value.verification_state != null ? criteria.value.verification_state : []
        content {
          comparison = verification_state.value.comparison
          value      = verification_state.value.value
        }
      }

      dynamic "workflow_status" {
        for_each = criteria.value.workflow_status != null ? criteria.value.workflow_status : []
        content {
          comparison = workflow_status.value.comparison
          value      = workflow_status.value.value
        }
      }
    }
  }
}
