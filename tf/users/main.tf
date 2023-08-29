terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.20.0"
    }
    zfs = {
      source = "MathiasPius/zfs"
      version = "0.5.0"
    }
  }
}


provider "postgresql" {
  host            = var.creds.db.host
  port            = var.creds.db.port
  username        = var.creds.db.username
  password        = var.creds.db.password
  sslmode         = var.creds.db.sslmode
  connect_timeout = 15
}

provider "zfs" {
  command_prefix = "sudo "
  user = var.creds.ssh.username
  host = var.creds.ssh.host
  key_path = var.creds.ssh.key_path
}