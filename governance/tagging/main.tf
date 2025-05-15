resource "azurerm_management_group" "root" {
  display_name = var.management_group_name
  name         = var.management_group_name
}

resource "azurerm_policy_definition" "enforce_tagging" {
  name                = "enforce-tagging"
  policy_type         = "Custom"
  mode                = "Indexed"
  display_name        = "Require Environment and Owner Tags"
  management_group_id = azurerm_management_group.root.id

  policy_rule = jsonencode({
    "if": {
      "anyOf": [
        {
          "field": "tags['Environment']",
          "exists": false
        },
        {
          "field": "tags['Owner']",
          "exists": false
        }
      ]
    },
    "then": {
      "effect": "deny"
    }
  })

  parameters = jsonencode({})
}

resource "azapi_resource" "assign_enforce_tagging" {
  type      = "Microsoft.Authorization/policyAssignments@2022-06-01"
  name      = "assign-enforce-tagging"
  location  = "global"
  parent_id = "/providers/Microsoft.Management/managementGroups/${azurerm_management_group.root.name}"

  body = jsonencode({
    properties = {
      displayName        = "Require Environment and Owner Tags"
      policyDefinitionId = azurerm_policy_definition.enforce_tagging.id
    }
  })
}
