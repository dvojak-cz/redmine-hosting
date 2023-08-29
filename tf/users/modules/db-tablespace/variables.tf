variable "client_name" {
  description = "name of the client"
  type        = string
}

variable "connection" {
  type        = object({
    type = string
    user = string
    key_path = string
    host = string 
  })
}