
variable "management_group_name" {
  description = "Nombre del grupo de administración raíz"
  type        = string
}

variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "tenant_id" {
  description = "ID del tenant de Azure AD"
  type        = string
}

variable "location" {
  description = "Región de despliegue"
  type        = string
}


