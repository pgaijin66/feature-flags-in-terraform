resource "digitalocean_droplet" "puny_vm" {
  image  = "ubuntu-18-04-x64"
  count = var.env == "dev" ? 1 : 0
  name   = "puny_vm"
  region = "nyc2"
  size   = "s-1vcpu-1gb"
}

resource "digitalocean_droplet" "beefy_vm" {
  image  = "ubuntu-18-04-x64"
  count = var.env == "prod" ? 3 : 0
  name   = "beefy_vm"
  region = "nyc2"
  size   = "s-4vcpu-8gb"
}

locals {
  droplets_id = concat(
    digitalocean_droplet.puny_vm[*].id,
    digitalocean_droplet.beefy_vm[*].id
  )
}