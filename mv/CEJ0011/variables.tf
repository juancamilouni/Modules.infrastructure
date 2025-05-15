variable "vm_name" {
  description = "Nombre de la máquina virtual"
  type        = string
}

variable "vm_size" {
  description = "SKU del tamaño de VM"
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

variable "subscription_id" {
  description = "ID de la suscripción"
  type        = string
}

variable "tenant_id" {
  description = "ID del tenant"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subred a utilizar"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID del workspace de Log Analytics"
  type        = string
}

variable "admin_username" {
  description = "Nombre del usuario administrador"
  type        = string
}

variable "ssh_public_key" {
  description = "Clave pública SSH del administrador"
  type        = string
}

variable "private_ip" {
  description = "IP privada estática a asignar"
  type        = string
}

variable "os_disk_size_gb" {
  type        = number
  description = "Tamaño del disco del sistema operativo (GB)"
}

variable "tags" {
  description = "Etiquetas comunes"
  type        = map(string)
}

variable "data_disk_sizes" {
  type        = list(number)
  description = "Lista con los tamaños de los discos de datos (GB)"
}


variable "custom_data" {
  description = "Archivo cloud-init codificado en base64"
  type        = string
}
