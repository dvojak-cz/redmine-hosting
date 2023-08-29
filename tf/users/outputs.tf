output "client_password" {
  value = nonsensitive(module.db-client.password)
}