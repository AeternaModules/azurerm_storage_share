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
}

