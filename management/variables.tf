variable "project_name" {
  description = "Nombre del proyecto para identificar el workspace y storage"
  type        = string
}

variable "location" {
  description = "Región de despliegue"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
}

variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID del tenant de Azure Active Directory"
  type        = string
}

variable "tags" {
  description = "Etiquetas obligatorias como Environment y Owner"
  type        = map(string)
}
