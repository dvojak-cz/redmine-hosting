creds = {
  db = {
    host = "172.16.16.100"
    port = 5432
    username = "postgres"
    password = "postgress"
    sslmode = "require"
  }
  ssh = {
    host = "172.16.16.100"
    username = "tf"
    key_path = "/home/jan/.ssh/id_rsa"
  }
}
zfs = {
  pool = {
    name = "db_pool"
    device = "/dev/sda"
  }
  main_fs = "db_pool/client"
  client_mount_point = "/var/db"
}
