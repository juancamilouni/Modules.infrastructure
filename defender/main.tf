
resource "azurerm_security_center_subscription_pricing" "vm_pricing" {
  tier          = "Standard"
  resource_type = "VirtualMachines"
}
   