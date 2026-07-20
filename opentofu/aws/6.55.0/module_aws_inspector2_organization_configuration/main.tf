resource "aws_inspector2_organization_configuration" "inspector2_organization_configurations" {
  for_each = var.inspector2_organization_configurations

  region = each.value.region

  dynamic "auto_enable" {
    for_each = each.value.auto_enable != null ? each.value.auto_enable : []
    content {
      ec2             = auto_enable.value.ec2
      ecr             = auto_enable.value.ecr
      code_repository = auto_enable.value.code_repository
      lambda          = auto_enable.value.lambda
      lambda_code     = auto_enable.value.lambda_code
    }
  }
}
