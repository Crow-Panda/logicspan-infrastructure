resource "google_compute_network" "vpc_network" {
  name                    = "logicspan-vpc"
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL" # FinOps Guardrail: prevents global routing egress costs
}

resource "google_compute_subnetwork" "subnet" {
  name          = "logicspan-subnet-eu-west2"
  ip_cidr_range = "10.0.1.0/24"
  region        = "europe-west2"
  network       = google_compute_network.vpc_network.id
}