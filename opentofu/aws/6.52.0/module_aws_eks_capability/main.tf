resource "aws_eks_capability" "eks_capabilities" {
  for_each = var.eks_capabilities

  capability_name           = each.value.capability_name
  cluster_name              = each.value.cluster_name
  delete_propagation_policy = each.value.delete_propagation_policy
  role_arn                  = each.value.role_arn
  type                      = each.value.type
  region                    = each.value.region
  tags                      = each.value.tags

  dynamic "configuration" {
    for_each = each.value.configuration != null ? each.value.configuration : []
    content {

      dynamic "argo_cd" {
        for_each = configuration.value.argo_cd != null ? configuration.value.argo_cd : []
        content {
          namespace = argo_cd.value.namespace

          dynamic "aws_idc" {
            for_each = argo_cd.value.aws_idc != null ? argo_cd.value.aws_idc : []
            content {
              idc_instance_arn = aws_idc.value.idc_instance_arn
              idc_region       = aws_idc.value.idc_region
            }
          }

          dynamic "network_access" {
            for_each = argo_cd.value.network_access != null ? argo_cd.value.network_access : []
            content {
              vpce_ids = network_access.value.vpce_ids
            }
          }

          dynamic "rbac_role_mapping" {
            for_each = argo_cd.value.rbac_role_mapping != null ? argo_cd.value.rbac_role_mapping : []
            content {
              role = rbac_role_mapping.value.role

              dynamic "identity" {
                for_each = rbac_role_mapping.value.identity != null ? rbac_role_mapping.value.identity : []
                content {
                  type = identity.value.type
                }
              }
            }
          }
        }
      }
    }
  }
}
