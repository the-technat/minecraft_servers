module "servers" {
  for_each = local.servers
  source   = "app.terraform.io/technat/vm/hcloud"
  version  = "1.1.0"

  common_labels = each.value.server_labels

  firewall_rules = each.value.firewall_rules

  server_location   = each.value.server_location
  server_name       = each.value.server_name
  server_ptr_record = each.value.server_ptr_record
  server_type       = each.value.server_type
  ssh_keys          = each.value.ssh_keys
  ssh_port          = each.value.ssh_keys
}

resource "hetznerdns_record" "server_dns_a" {
  for_each = local.servers
  zone_id  = data.hetznerdns_zone.technat_dev.id
  name     = each.value.server_name
  type     = "A"
  value    = module.servers[each.key].server_ipv4_address
  ttl      = 300
}

resource "hetznerdns_record" "server_dns_aaaa" {
  for_each = local.servers
  zone_id  = data.hetznerdns_zone.technat_dev.id
  name     = each.value.server_name
  type     = "AAAA"
  value    = module.servers[each.key].server_ipv6_address
  ttl      = 300
}

