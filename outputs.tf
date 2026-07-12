output "storage_shares_access_tier" {
  description = "Map of access_tier values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.access_tier }
}
output "storage_shares_acl" {
  description = "Map of acl values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.acl }
}
output "storage_shares_enabled_protocol" {
  description = "Map of enabled_protocol values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.enabled_protocol }
}
output "storage_shares_metadata" {
  description = "Map of metadata values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.metadata }
}
output "storage_shares_name" {
  description = "Map of name values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.name }
}
output "storage_shares_quota" {
  description = "Map of quota values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.quota }
}
output "storage_shares_rbac_scope_id" {
  description = "Map of rbac_scope_id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.rbac_scope_id }
}
output "storage_shares_resource_manager_id" {
  description = "Map of resource_manager_id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.resource_manager_id }
}
output "storage_shares_storage_account_id" {
  description = "Map of storage_account_id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.storage_account_id }
}
output "storage_shares_storage_account_name" {
  description = "Map of storage_account_name values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.storage_account_name }
}
output "storage_shares_url" {
  description = "Map of url values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.url }
}

