variable "client_name" {
  description = "name of the client"
  type        = string
}

variable "quota" {
  description = "disk quota for the client"
  type = string
}

variable "zfs_base" {
  type        = string
}

variable "mountpoint_base" {
  type        = string
}