output "server_list" {
  description = "List of all the servers with their IP/DNS record"
  value = flatten([
    for server_key, values in local.servers : {
      name = values.server_name
      ip   = module.servers[server_key].server_ipv4_address
      dns  = values.server_ptr_record
    }
  ])
}
