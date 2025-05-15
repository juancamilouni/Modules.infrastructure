variable "name" {
  description = "Nombre de la Managed Identity"
  type        = string
}

variable "location" {
  description = "Ubicación del recurso"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
}

variable "tags" {
  description = "Etiquetas obligatorias como Environment y Owner"
  type        = map(string)
}
