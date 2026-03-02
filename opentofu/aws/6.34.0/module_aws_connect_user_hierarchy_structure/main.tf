resource "aws_connect_user_hierarchy_structure" "connect_user_hierarchy_structures" {
  for_each = var.connect_user_hierarchy_structures

  instance_id = each.value.instance_id
  region      = each.value.region

  dynamic "hierarchy_structure" {
    for_each = each.value.hierarchy_structure != null ? each.value.hierarchy_structure : []
    content {

      dynamic "level_five" {
        for_each = hierarchy_structure.value.level_five != null ? hierarchy_structure.value.level_five : []
        content {
          name = level_five.value.name
        }
      }

      dynamic "level_four" {
        for_each = hierarchy_structure.value.level_four != null ? hierarchy_structure.value.level_four : []
        content {
          name = level_four.value.name
        }
      }

      dynamic "level_one" {
        for_each = hierarchy_structure.value.level_one != null ? hierarchy_structure.value.level_one : []
        content {
          name = level_one.value.name
        }
      }

      dynamic "level_three" {
        for_each = hierarchy_structure.value.level_three != null ? hierarchy_structure.value.level_three : []
        content {
          name = level_three.value.name
        }
      }

      dynamic "level_two" {
        for_each = hierarchy_structure.value.level_two != null ? hierarchy_structure.value.level_two : []
        content {
          name = level_two.value.name
        }
      }
    }
  }
}
