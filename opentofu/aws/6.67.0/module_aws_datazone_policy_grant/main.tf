resource "aws_datazone_policy_grant" "datazone_policy_grants" {
  for_each = var.datazone_policy_grants

  domain_identifier = each.value.domain_identifier
  entity_identifier = each.value.entity_identifier
  entity_type       = each.value.entity_type
  policy_type       = each.value.policy_type
  region            = each.value.region

  dynamic "detail" {
    for_each = each.value.detail != null ? each.value.detail : []
    content {

      dynamic "add_to_project_member_pool" {
        for_each = detail.value.add_to_project_member_pool != null ? detail.value.add_to_project_member_pool : []
        content {
          include_child_domain_units = add_to_project_member_pool.value.include_child_domain_units
        }
      }

      dynamic "create_asset_type" {
        for_each = detail.value.create_asset_type != null ? detail.value.create_asset_type : []
        content {
          include_child_domain_units = create_asset_type.value.include_child_domain_units
        }
      }

      dynamic "create_domain_unit" {
        for_each = detail.value.create_domain_unit != null ? detail.value.create_domain_unit : []
        content {
          include_child_domain_units = create_domain_unit.value.include_child_domain_units
        }
      }

      dynamic "create_environment" {
        for_each = detail.value.create_environment != null ? detail.value.create_environment : []
        content {
        }
      }

      dynamic "create_environment_from_blueprint" {
        for_each = detail.value.create_environment_from_blueprint != null ? detail.value.create_environment_from_blueprint : []
        content {
        }
      }

      dynamic "create_environment_profile" {
        for_each = detail.value.create_environment_profile != null ? detail.value.create_environment_profile : []
        content {
          domain_unit_id = create_environment_profile.value.domain_unit_id
        }
      }

      dynamic "create_form_type" {
        for_each = detail.value.create_form_type != null ? detail.value.create_form_type : []
        content {
          include_child_domain_units = create_form_type.value.include_child_domain_units
        }
      }

      dynamic "create_glossary" {
        for_each = detail.value.create_glossary != null ? detail.value.create_glossary : []
        content {
          include_child_domain_units = create_glossary.value.include_child_domain_units
        }
      }

      dynamic "create_project" {
        for_each = detail.value.create_project != null ? detail.value.create_project : []
        content {
          include_child_domain_units = create_project.value.include_child_domain_units
        }
      }

      dynamic "create_project_from_project_profile" {
        for_each = detail.value.create_project_from_project_profile != null ? detail.value.create_project_from_project_profile : []
        content {
          include_child_domain_units = create_project_from_project_profile.value.include_child_domain_units
          project_profiles           = create_project_from_project_profile.value.project_profiles
        }
      }

      dynamic "delegate_create_environment_profile" {
        for_each = detail.value.delegate_create_environment_profile != null ? detail.value.delegate_create_environment_profile : []
        content {
        }
      }

      dynamic "override_domain_unit_owners" {
        for_each = detail.value.override_domain_unit_owners != null ? detail.value.override_domain_unit_owners : []
        content {
          include_child_domain_units = override_domain_unit_owners.value.include_child_domain_units
        }
      }

      dynamic "override_project_owners" {
        for_each = detail.value.override_project_owners != null ? detail.value.override_project_owners : []
        content {
          include_child_domain_units = override_project_owners.value.include_child_domain_units
        }
      }

      dynamic "use_asset_type" {
        for_each = detail.value.use_asset_type != null ? detail.value.use_asset_type : []
        content {
          domain_unit_id = use_asset_type.value.domain_unit_id
        }
      }
    }
  }

  dynamic "principal" {
    for_each = each.value.principal != null ? each.value.principal : []
    content {

      dynamic "domain_unit" {
        for_each = principal.value.domain_unit != null ? principal.value.domain_unit : []
        content {
          domain_unit_designation = domain_unit.value.domain_unit_designation
          domain_unit_identifier  = domain_unit.value.domain_unit_identifier

          dynamic "all_domain_units_grant_filter" {
            for_each = domain_unit.value.all_domain_units_grant_filter != null ? domain_unit.value.all_domain_units_grant_filter : []
            content {
            }
          }
        }
      }

      dynamic "group" {
        for_each = principal.value.group != null ? principal.value.group : []
        content {
          group_identifier = group.value.group_identifier
        }
      }

      dynamic "project" {
        for_each = principal.value.project != null ? principal.value.project : []
        content {
          project_designation = project.value.project_designation
          project_identifier  = project.value.project_identifier

          dynamic "domain_unit_filter" {
            for_each = project.value.domain_unit_filter != null ? project.value.domain_unit_filter : []
            content {
              domain_unit                = domain_unit_filter.value.domain_unit
              include_child_domain_units = domain_unit_filter.value.include_child_domain_units
            }
          }
        }
      }

      dynamic "user" {
        for_each = principal.value.user != null ? principal.value.user : []
        content {
          user_identifier = user.value.user_identifier

          dynamic "all_users_grant_filter" {
            for_each = user.value.all_users_grant_filter != null ? user.value.all_users_grant_filter : []
            content {
            }
          }
        }
      }
    }
  }
}
