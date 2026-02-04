variable "yc_token" {
  description = "Yandex Cloud API token"
  sensitive   = true
  type        = string
}

variable "yc_cloud_id" {
  description = "Current working cloud Yandex Cloud"
  sensitive   = false
  type        = string
}

variable "yc_folder_id" {
  description = "Current working directory Yandex Cloud"
  sensitive   = false
  type        = string
}

variable "yc_zone" {
  description = "Current zone deploy resources Yandex Cloud"
  sensitive   = false
  type        = string
}

variable "db_version" {
  description = "Postgres DB: version"
  sensitive   = false
  type        = number
}

variable "db_port" {
  description = "Postgres DB: port"
  sensitive   = false
  type        = number
}

variable "db_name" {
  description = "Postgres DB: name"
  sensitive   = false
  type        = string
}

variable "db_user" {
  description = "Postgres DB: username"
  sensitive   = true
  type        = string
}

variable "db_password" {
  description = "Postgres DB: password"
  sensitive   = true
  type        = string
}

variable "yc_ssl" {
  description = "Certificate SSL"
  sensitive   = true
  type        = string
}

variable "dd_api_key" {
  description = "DataDog API Key"
  sensitive   = true
  type        = string
}