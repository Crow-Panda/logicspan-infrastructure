resource "google_storage_bucket" "asset_bucket" {
  name          = "logicspan-assets-dev-euw2" # Must be globally unique
  location      = "EUROPE-WEST2"
  force_destroy = true
  storage_class = "STANDARD"

  # FinOps Guardrail: Automatically transition older objects to cheaper storage
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
}
