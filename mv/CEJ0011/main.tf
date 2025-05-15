resource "azurerm_network_interface" "cej0011_nic" {
  name                = "nic-CEJ0011"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "cej0011" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  custom_data         = var.custom_data


  network_interface_ids = [azurerm_network_interface.cej0011_nic.id]
  disable_password_authentication = true
  encryption_at_host_enabled      = true # Cifra los discos directamente desde el host

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    name                 = "osdisk-${var.vm_name}"
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "9-lvm"
    version   = "latest"
  }

  tags = var.tags
}

# Recomendación: Guest Configuration para cumplimiento de políticas
resource "azurerm_virtual_machine_extension" "guest_config" {
  name                       = "GuestConfiguration"
  virtual_machine_id         = azurerm_linux_virtual_machine.cej0011.id
  publisher                  = "Microsoft.GuestConfiguration"
  type                       = "ConfigurationforLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}


# Disco de datos adicional
resource "azurerm_managed_disk" "cej0011_data_disk" {
  count                = length(var.data_disk_sizes)
  name                 = "${var.vm_name}-datadisk-${count.index}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "StandardSSD_LRS"
  disk_size_gb         = var.data_disk_sizes[count.index]
  create_option        = "Empty"
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "attachments" {
  count              = length(var.data_disk_sizes)
  managed_disk_id    = azurerm_managed_disk.cej0011_data_disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.cej0011.id
  lun                = count.index
  caching            = "ReadWrite"
}




