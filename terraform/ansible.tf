resource "local_file" "inventory" {
  content = templatefile("../ansible/templates/inventory.ini.tpl", {
    vm_1_ip = yandex_compute_instance.vm-1.network_interface[0].nat_ip_address
    vm_2_ip = yandex_compute_instance.vm-2.network_interface[0].nat_ip_address
  })
  filename   = "../ansible/inventory.ini"
  depends_on = [yandex_compute_instance.vm-1, yandex_compute_instance.vm-2]
}

resource "local_file" "vault" {
  content = templatefile("../ansible/templates/vault.tpl", {
    db_password = var.db_password
    dd_api_key  = var.dd_api_key
  })
  filename = "../ansible/group_vars/webservers/vault.yml"
}

resource "null_resource" "encrypt_vault" {
  depends_on = [local_file.vault]

  provisioner "local-exec" {
    command     = "make vault-encrypt"
    working_dir = "../ansible"
  }
}

resource "local_file" "env" {
  content = templatefile("../ansible/templates/.env.tpl", {
    db_host     = yandex_mdb_postgresql_cluster.dbcluster.host.0.fqdn
    db_port     = var.db_port
    db_name     = var.db_name
    db_username = var.db_user
    db_password = var.db_password
  })
  filename   = "../ansible/templates/.env.j2"
  depends_on = [yandex_mdb_postgresql_cluster.dbcluster]
}