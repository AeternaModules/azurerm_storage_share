output "storage_shares_id" {
  description = "Map of id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.id if v.id != null && length(v.id) > 0 }
}
output "storage_shares_access_tier" {
  description = "Map of access_tier values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.access_tier if v.access_tier != null && length(v.access_tier) > 0 }
}
output "storage_shares_acl" {
  description = "Map of acl values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.acl if v.acl != null && length(v.acl) > 0 }
}
output "storage_shares_enabled_protocol" {
  description = "Map of enabled_protocol values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.enabled_protocol if v.enabled_protocol != null && length(v.enabled_protocol) > 0 }
}
output "storage_shares_metadata" {
  description = "Map of metadata values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "storage_shares_name" {
  description = "Map of name values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.name if v.name != null && length(v.name) > 0 }
}
output "storage_shares_quota" {
  description = "Map of quota values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.quota if v.quota != null }
}
output "storage_shares_rbac_scope_id" {
  description = "Map of rbac_scope_id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.rbac_scope_id if v.rbac_scope_id != null && length(v.rbac_scope_id) > 0 }
}
output "storage_shares_storage_account_id" {
  description = "Map of storage_account_id values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.storage_account_id if v.storage_account_id != null && length(v.storage_account_id) > 0 }
}
output "storage_shares_url" {
  description = "Map of url values across all storage_shares, keyed the same as var.storage_shares"
  value       = { for k, v in azurerm_storage_share.storage_shares : k => v.url if v.url != null && length(v.url) > 0 }
}

