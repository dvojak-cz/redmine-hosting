variable "zfs" {
  type = object({
    pool = object({
      name = string,
      device = string
    })
    main_fs = string
    client_mount_point = string
  }) 
}

variable "creds" {
  type = object({
    db = object({
      host = string
      username = string
      password = string
      port = number
      sslmode = string
    })
    ssh = object({
      host = string
      username = string
      key_path = string
    })
  })
  sensitive = true
}
