variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}
variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID del tenant de Azure Active Directory"
  type        = string
}
variable "container_name" {
  description = "Nombre del contenedor de almacenamiento"
  type        = string
}

variable "tag" {
  type    = string
  default = "v0.0.3" # Cambia a v0.0.4
}
