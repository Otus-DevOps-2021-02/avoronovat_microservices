variable cloud_id {
  description = "Cloud"
}

variable folder_id {
  description = "Folder"
}

variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}

variable service_account_key_file {
  description = "key.json"
}

variable public_key_path {
  description = "path to public ssh key"
}

variable subnet_id {
  description = "zone subnet id"
}

variable instances_count {
  description = "count of instances"
  default = 1
}
