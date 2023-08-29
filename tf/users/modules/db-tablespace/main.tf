resource "null_resource" "create_tablespace" {
  
  connection {
      type        = var.connection.type
      user        = var.connection.user
      private_key = file(var.connection.key_path)
      host        = var.connection.host
    }

  provisioner "remote-exec" {
    when    = create
    inline  = [
      "sudo -u postgres psql -c \"CREATE TABLESPACE ${var.client_name} LOCATION '/var/db/${var.client_name}';\" || true "]
  }
}