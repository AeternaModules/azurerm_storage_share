resource "azurerm_storage_share" "storage_shares" {
  for_each = var.storage_shares

  name                 = each.value.name
  quota                = each.value.quota
  access_tier          = each.value.access_tier
  enabled_protocol     = each.value.enabled_protocol
  metadata             = each.value.metadata
  storage_account_id   = each.value.storage_account_id
  storage_account_name = each.value.storage_account_name

  dynamic "acl" {
    for_each = each.value.acl != null ? [each.value.acl] : []
    content {
      dynamic "access_policy" {
        for_each = acl.value.access_policy != null ? [acl.value.access_policy] : []
        content {
          expiry      = access_policy.value.expiry
          permissions = access_policy.value.permissions
          start       = access_policy.value.start
        }
      }
      id = acl.value.id
    }
  }
}

