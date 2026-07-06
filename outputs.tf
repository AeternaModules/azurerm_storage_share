output "storage_shares" {
  description = "All storage_share resources"
  value       = azurerm_storage_share.storage_shares
}
output "storage_shares_access_tier" {
  description = "List of access_tier values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.access_tier]
}
output "storage_shares_acl" {
  description = "List of acl values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.acl]
}
output "storage_shares_enabled_protocol" {
  description = "List of enabled_protocol values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.enabled_protocol]
}
output "storage_shares_metadata" {
  description = "List of metadata values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.metadata]
}
output "storage_shares_name" {
  description = "List of name values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.name]
}
output "storage_shares_quota" {
  description = "List of quota values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.quota]
}
output "storage_shares_rbac_scope_id" {
  description = "List of rbac_scope_id values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.rbac_scope_id]
}
output "storage_shares_resource_manager_id" {
  description = "List of resource_manager_id values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.resource_manager_id]
}
output "storage_shares_storage_account_id" {
  description = "List of storage_account_id values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.storage_account_id]
}
output "storage_shares_storage_account_name" {
  description = "List of storage_account_name values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.storage_account_name]
}
output "storage_shares_url" {
  description = "List of url values across all storage_shares"
  value       = [for k, v in azurerm_storage_share.storage_shares : v.url]
}

