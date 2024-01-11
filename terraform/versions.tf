terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "technat"

    workspaces {
      name = "minecraft_servers"
    }

  }
  required_providers {
    hetznerdns = {
      source  = "timohirt/hetznerdns"
      version = "2.2.0"
    }
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.45.0"
    }
  }
}
