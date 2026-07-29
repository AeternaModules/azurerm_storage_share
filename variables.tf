variable "storage_shares" {
  description = <<EOT
Map of storage_shares, attributes below
Required:
    - name
    - quota
    - storage_account_id
Optional:
    - access_tier
    - enabled_protocol
    - metadata
    - acl (block):
        - access_policy (optional, block):
            - expiry (optional)
            - permissions (required)
            - start (optional)
        - id (required)
EOT

  type = map(object({
    name               = string
    quota              = number
    storage_account_id = string
    access_tier        = optional(string)
    enabled_protocol   = optional(string)
    metadata           = optional(map(string))
    acl = optional(list(object({
      access_policy = optional(list(object({
        expiry      = optional(string)
        permissions = string
        start       = optional(string)
      })))
      id = string
    })))
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
        v.acl == null || alltrue([for item in v.acl : (length(item.id) >= 1 && length(item.id) <= 64)])
      )
    ])
    error_message = "must be between 1 and 64 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.storage_shares : (
        v.acl == null || alltrue([for item in v.acl : (item.access_policy == null || alltrue([for item in item.access_policy : (length(item.permissions) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 12 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

