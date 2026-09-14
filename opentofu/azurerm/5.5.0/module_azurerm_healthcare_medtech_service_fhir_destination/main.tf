resource "azurerm_healthcare_medtech_service_fhir_destination" "healthcare_medtech_service_fhir_destinations" {
  for_each = var.healthcare_medtech_service_fhir_destinations

  destination_fhir_mapping_json        = each.value.destination_fhir_mapping_json
  destination_fhir_service_id          = each.value.destination_fhir_service_id
  destination_identity_resolution_type = each.value.destination_identity_resolution_type
  location                             = each.value.location
  medtech_service_id                   = each.value.medtech_service_id
  name                                 = each.value.name
}
