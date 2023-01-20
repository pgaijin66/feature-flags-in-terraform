variable "env" {
  type = string
  default = "dev"
}


module "droplet" {
  source = "./modules/droplet"
  do_token = var.do_token
  env = var.env
}

module "lb" {
  source = "./modules/loadbalancer"

  count = local.config.feature_flags.provision_lb ? 1 : 0

  do_token = var.do_token
  droplets_id = module.droplet.droplets_id
}


module "db" {
  source = "./modules/database"
  do_token = var.do_token
  env = var.env
  provision_db = local.config.feature_flags.provision_db
}

