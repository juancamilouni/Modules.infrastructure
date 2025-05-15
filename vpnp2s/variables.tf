variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "gateway_subnet_id" {
  description = "ID of the Gateway Subnet"
  type        = string
}

variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
