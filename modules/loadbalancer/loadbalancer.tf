resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "nyc3"

  # count = var.provision_lb == true ? 1 : 0

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 22
    protocol = "tcp"
  }

  droplet_ids = var.droplets_id[*]
}