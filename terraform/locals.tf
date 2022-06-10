local {
  ssh_keys = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJZaYImQlHj27adAN+bR3i2ac3PkqoGRyoXIvbsVTvwr service_ansible", "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJov21J2pGxwKIhTNPHjEkDy90U8VJBMiAodc2svmnFC cardno:18 055 612"]
  ssh_port = 59245
  common_labels = {
    "app"           = "minecraft"
    "created_by"    = "terraform"
    "configured-by" = "ansible"
  }
}
