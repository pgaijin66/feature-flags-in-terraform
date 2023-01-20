resource "digitalocean_database_db" "db_puny" {
  cluster_id = digitalocean_database_cluster.postgres_puny[count.index].id
  name       = "db_puny"
  count      = ( var.env == "dev" && var.provision_db )? 1 : 0
}

resource "digitalocean_database_cluster" "postgres_puny" {
  name       = "puny_db"
  engine     = "pg"
  version    = "11"
  size       = "db-s-1vcpu-1gb"
  region     = "nyc1"
  node_count = ( count.index == 0 ? 1 : 0 )
  count      = ( var.env == "dev" && var.provision_db )? 1 : 0
}

resource "digitalocean_database_db" "db_beefy" {
  cluster_id = digitalocean_database_cluster.postgres_beefy[count.index].id
  name       = "db_beefy"
  count      = ( var.env == "prod" && var.provision_db )? 1 : 0
}

resource "digitalocean_database_cluster" "postgres_beefy" {
  name       = "beefy_db"
  engine     = "pg"
  version    = "11"
  size       = "db-s-4vcpu-8gb"
  region     = "nyc1"
  node_count = ( count.index == 0 ? 1 : 0 )
  count      = ( var.env == "prod" && var.provision_db )? 1 : 0
}