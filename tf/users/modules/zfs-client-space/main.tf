terraform {
  required_providers {
    zfs = {
      source = "MathiasPius/zfs"
      version = "0.5.0"
    }
  }
}

resource "zfs_dataset" "client" {
  name = "${var.zfs_base}/${var.client_name}"
  mountpoint = "${var.mountpoint_base}/${var.client_name}"
  owner = "postgres"
  property {
    name  = "quota"
    value = var.quota
  }
}