variable project {
  description = "Project ID"
}
variable region {
  description = "Region"
  # Значение по умолчанию
  default = "europe-west3-b"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "europe-west3-b"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the private key used for ssh access"
}
variable disk_image {
  description = "Disk image"
}
variable counter {
  description = "Counter of app instances"
  default = 1
}
