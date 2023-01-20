# Fetching all the variables from config.yml
locals {
  config = yamldecode(file("config.yaml"))
}