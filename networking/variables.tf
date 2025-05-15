variable "vnet_name" {
  description = "Nombre de la VNet"
  type        = string
}

variable "address_space" {
  description = "Espacio de direcciones de la VNet"
  type        = list(string)
}

variable "location" {
  description = "Ubicación del recurso"
  type        = string
}

variable "resource_group_name" {
  description = "Grupo de recursos"
  type        = string
}

variable "subscription_id" {
  description = "ID de la suscripción"
  type        = string
}

variable "tenant_id" {
  description = "ID del tenant de Azure"
  type        = string
}

variable "tags" {
  description = "Etiquetas para la VNet"
  type        = map(string)
}

variable "subnets" {
  description = "Subredes de la VNet"
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))
}

variable "gateway_subnet_prefix" {
  description = "CIDR para la subred Gateway (VPN)"
  type        = string
  default     = null
}
