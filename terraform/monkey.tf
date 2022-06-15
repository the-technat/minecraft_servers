module "monkey" {
  source  = "app.terraform.io/technat/vm/hcloud"
  version = "1.1.0"

  common_labels = local.common_labels

  firewall_rules = local.common_firewall_rules

  server_location   = "hel1"
  server_name       = "monkey"
  server_ptr_record = "monkey.technat.dev"
  server_type       = "cx21"
  ssh_keys          = local.ssh_keys
  ssh_port          = local.ssh_port
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
