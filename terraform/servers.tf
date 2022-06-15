locals {
  ssh_port = 59245
  ssh_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZaYImQlHj27adAN+bR3i2ac3PkqoGRyoXIvbsVTvwr service_ansible", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJov21J2pGxwKIhTNPHjEkDy90U8VJBMiAodc2svmnFC cardno:18 055 612"]
  server_labels = {
    "app"           = "minecraft"
    "created_by"    = "terraform"
    "configured-by" = "ansible"
  }
  firewall_rules = [
    {
      port       = 25565
      protocol   = "tcp"
      direction  = "in"
      source_ips = ["0.0.0.0/0", "::/0"]
    },
    {
      port       = 25565
      protocol   = "udp"
      direction  = "in"
      source_ips = ["0.0.0.0/0", "::/0"]
    }
  ]
  servers = {
    "monkey" = {
      server_name       = "monkey"
      server_ptr_record = "monkey.technat.dev"
      server_image      = "debian-11"
      server_type       = "cx21"
      server_location   = "hel1"
      ssh_keys          = local.ssh_keys
      ssh_port          = local.ssh_port
      server_labels     = local.server_labels
      firewall_rules    = local.firewall_rules
    }
    # "gorilla" = {
    #   server_name       = "gorilla"
    #   server_ptr_record = "gorilla.technat.dev"
    #   server_image      = "debian-11"
    #   server_type       = "ccx32"
    #   server_location   = "hel1"
    #   ssh_keys          = local.ssh_keys
    #   ssh_port          = local.ssh_port
    #   server_labels     = local.server_labels
    #   firewall_rules    = local.firewall_rules
    # }
  }
}
