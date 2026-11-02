resource "google_compute_instance" "app_server" {
  name         = "logicspan-app-dev"
  machine_type = "e2-micro" # FinOps Guardrail: Right-sized for dev
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network    = "logicspan-vpc"
    subnetwork = "logicspan-subnet-eu-west2"
  }

  # FinOps Guardrail: Spot instances provide up to 91% discount for fault-tolerant dev workloads
  scheduling {
    preemptible                 = true
    automatic_restart           = false
    provisioning_model          = "SPOT"
    instance_termination_action = "STOP"
  }
}