module "monkey" {
  source  = "app.terraform.io/technat/vm/hcloud"
  version = "0.1.0"

  common_labels = {
    "app"           = "minecraft"
    "created-by"    = "terraform"
    "configured-by" = "ansible"
  }

  server_location   = "hel1"
  server_name       = "monkey"
  server_ptr_record = "monkey.technat.dev"
  server_type       = "cx21"
  ssh_keys          = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJov21J2pGxwKIhTNPHjEkDy90U8VJBMiAodc2svmnFC cardno:18 055 612"]
  ssh_port          = 59245
}

resource "hetznerdns_record" "monkey_technat_dev_a" {
  zone_id = data.hetznerdns_zone.technat_dev.id
  name    = "monkey"
  type    = "A"
  value   = module.monkey.server_ipv4_address
  ttl     = 300
}

resource "hetznerdns_record" "monkey_technat_dev_aaaa" {
  zone_id = data.hetznerdns_zone.technat_dev.id
  name    = "monkey"
  type    = "AAAA"
  value   = module.monkey.server_ipv6_address
  ttl     = 300
}
