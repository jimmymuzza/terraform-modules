resource "azurerm_sentinel_threat_intelligence_indicator" "sentinel_threat_intelligence_indicators" {
  for_each = var.sentinel_threat_intelligence_indicators

  display_name        = each.value.display_name
  pattern             = each.value.pattern
  pattern_type        = each.value.pattern_type
  source              = each.value.source
  validate_from_utc   = each.value.validate_from_utc
  workspace_id        = each.value.workspace_id
  confidence          = each.value.confidence
  created_by          = each.value.created_by
  description         = each.value.description
  extension           = each.value.extension
  language            = each.value.language
  object_marking_refs = each.value.object_marking_refs
  pattern_version     = each.value.pattern_version
  revoked             = each.value.revoked
  tags                = each.value.tags
  threat_types        = each.value.threat_types
  validate_until_utc  = each.value.validate_until_utc

  dynamic "external_reference" {
    for_each = each.value.external_reference != null ? each.value.external_reference : []
    content {
      description = external_reference.value.description
      hashes      = external_reference.value.hashes
      source_name = external_reference.value.source_name
      url         = external_reference.value.url
    }
  }

  dynamic "granular_marking" {
    for_each = each.value.granular_marking != null ? each.value.granular_marking : []
    content {
      language    = granular_marking.value.language
      marking_ref = granular_marking.value.marking_ref
      selectors   = granular_marking.value.selectors
    }
  }

  dynamic "kill_chain_phase" {
    for_each = each.value.kill_chain_phase != null ? each.value.kill_chain_phase : []
    content {
      name = kill_chain_phase.value.name
    }
  }
}
