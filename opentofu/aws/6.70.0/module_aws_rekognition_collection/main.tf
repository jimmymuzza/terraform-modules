resource "aws_rekognition_collection" "rekognition_collections" {
  for_each = var.rekognition_collections

  collection_id = each.value.collection_id
  region        = each.value.region
  tags          = each.value.tags
}
