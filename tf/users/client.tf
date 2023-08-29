locals {
  client_name = "my_client"
}


module "zfs-client-space" {
  source = "./modules/zfs-client-space"
  client_name = local.client_name
  quota = "8G"
  zfs_base = var.zfs.main_fs
  mountpoint_base = var.zfs.client_mount_point
  depends_on = [ zfs_dataset.client ]
}

module "db-tablespace" {
  source = "./modules/db-tablespace"
  client_name = local.client_name
  connection = {
    type = "ssh"
    user = var.creds.ssh.username
    key_path = var.creds.ssh.key_path
    host = var.creds.ssh.host
  }
  depends_on = [ module.zfs-client-space ]
}

module "db-client" {
  source = "./modules/db-client"
  client_name = local.client_name
  depends_on = [ module.db-tablespace ]
}
