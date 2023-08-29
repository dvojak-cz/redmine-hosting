# create a password for the new user
terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.20.0"
    }
  }
}

resource "random_password" "db_password" {
  length  = 16
  special = true
}

resource "postgresql_role" "user" {
  name      = var.client_name
  login     = true
  password  = random_password.db_password.result
  superuser = false
  connection_limit = -1
  depends_on = [random_password.db_password]
}

resource "postgresql_database" "db" {
  name              = var.client_name
  owner             = var.client_name
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
  tablespace_name   = var.client_name
  depends_on = [ postgresql_role.user ]
}

resource "postgresql_grant" "table_access" {
  database    = var.client_name
  role        = var.client_name
  schema      = "public"
  object_type = "table"
  privileges  = ["ALL"]
  depends_on  = [postgresql_database.db]
}


