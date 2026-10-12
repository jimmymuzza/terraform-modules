resource "aws_savingsplans_savings_plan" "savingsplans_savings_plans" {
  for_each = var.savingsplans_savings_plans

  commitment               = each.value.commitment
  savings_plan_offering_id = each.value.savings_plan_offering_id
  purchase_time            = each.value.purchase_time
  tags                     = each.value.tags
  upfront_payment_amount   = each.value.upfront_payment_amount
}
