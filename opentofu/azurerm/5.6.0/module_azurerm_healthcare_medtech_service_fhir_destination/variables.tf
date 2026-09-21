variable "healthcare_medtech_service_fhir_destinations" {
  description = <<EOT
Map of healthcare_medtech_service_fhir_destinations, attributes below
Required:
    - destination_fhir_mapping_json
    - destination_fhir_service_id
    - destination_identity_resolution_type
    - location
    - medtech_service_id
    - name
EOT

  type = map(object({
    destination_fhir_mapping_json        = string
    destination_fhir_service_id          = string
    destination_identity_resolution_type = string
    location                             = string
    medtech_service_id                   = string
    name                                 = string
  }))
}
