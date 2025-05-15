variable "scope" {
  description = "Scope donde se aplicará la política (puede ser un subscription_id o management group)"
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
