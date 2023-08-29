resource "zfs_pool" "db_pool" {
  name = var.zfs.pool.name
  device {
        path = var.zfs.pool.device
    }
}

resource "zfs_dataset" "client" {
  name = var.zfs.main_fs
  depends_on = [ zfs_pool.db_pool ]
}