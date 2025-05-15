resource "azurerm_policy_definition" "restrict_locations" {
  name         = "allowed-locations"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allow only specific locations"

  policy_rule = jsonencode({
    "if": {
      "field": "location",
      "notIn": ["eastus", "centralus"]
    },
    "then": {
      "effect": "deny"
    }
  })
}

resource "azapi_resource" "assign_restrict_locations" {
  type      = "Microsoft.Authorization/policyAssignments@2022-06-01"
  name      = "assign-allowed-locations"
  location  = "global"
  parent_id = var.scope

  body = jsonencode({
    properties = {
      displayName        = "Enforce allowed regions"
      policyDefinitionId = azurerm_policy_definition.restrict_locations.id
    }
  })
}
