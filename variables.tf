variable "storage_shares" {
  description = <<EOT
Map of storage_shares, attributes below
Required:
    - name
    - quota
Optional:
    - access_tier
    - enabled_protocol
    - metadata
    - storage_account_id
    - storage_account_name
    - acl (block):
        - access_policy (optional, block):
            - expiry (optional)
            - permissions (required)
            - start (optional)
        - id (required)
EOT

  type = map(object({
    name                 = string
    quota                = number
    access_tier          = optional(string)
    enabled_protocol     = optional(string) # Default: "SMB"
    metadata             = optional(map(string))
    storage_account_id   = optional(string)
    storage_account_name = optional(string)
    acl = optional(object({
      access_policy = optional(object({
        expiry      = optional(string)
        permissions = string
        start       = optional(string)
      }))
      id = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.storage_shares : (
        v.quota >= 1 && v.quota <= 102400
      )
    ])
    error_message = "must be between 1 and 102400"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_shares : (
        v.acl == null || (length(v.acl.id) >= 1 && length(v.acl.id) <= 64)
      )
    ])
    error_message = "must be between 1 and 64 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_shares : (
        v.acl == null || (v.acl.access_policy == null || (length(v.acl.access_policy.permissions) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_storage_share's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.StorageShareName] !regexp.MustCompile(`^[0-9a-z-]+$`).MatchString(value)
  # path: name
  #   source:    [from validate.StorageShareName] len(value) < 3 || len(value) > 63
  # path: name
  #   source:    [from validate.StorageShareName] regexp.MustCompile(`^-`).MatchString(value)
  # path: name
  #   source:    [from validate.StorageShareName] regexp.MustCompile(`[-]{2,}`).MatchString(value)
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] !ok
  # path: storage_account_id
  #   source:    [from commonids.ValidateStorageAccountID] err != nil
  # path: enabled_protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: acl.access_policy.start
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: acl.access_policy.expiry
  #   source:    validation.IsRFC3339Time(...) - no translation rule yet, add one
  # path: access_tier
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
}

