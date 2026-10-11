variable "apps_servicemodel_component_v1alpha1s" {
  description = <<EOT
Map of apps_servicemodel_component_v1alpha1s, attributes below
Optional:
    - metadata (block):
        - folder_uid (optional)
        - uid (required)
    - options (block):
        - manager_identity (optional)
        - overwrite (optional)
    - spec (block):
        - depends_on_refs (optional, block):
            - api_version (optional)
            - kind (optional)
            - name (required)
        - description (optional)
        - identifiers (optional, block):
            - key (required)
            - value (required)
        - links (optional, block):
            - icon (optional)
            - title (optional)
            - type (optional)
            - url (required)
        - owner_ref (optional, block):
            - api_version (optional)
            - kind (optional)
            - name (optional)
        - title (required)
        - type (optional)
EOT

  type = map(object({
    metadata = optional(list(object({
      folder_uid = optional(string)
      uid        = string
    })))
    options = optional(list(object({
      manager_identity = optional(string)
      overwrite        = optional(bool)
    })))
    spec = optional(list(object({
      depends_on_refs = optional(list(object({
        api_version = optional(string)
        kind        = optional(string)
        name        = string
      })))
      description = optional(string)
      identifiers = optional(list(object({
        key   = string
        value = string
      })))
      links = optional(list(object({
        icon  = optional(string)
        title = optional(string)
        type  = optional(string)
        url   = string
      })))
      owner_ref = optional(list(object({
        api_version = optional(string)
        kind        = optional(string)
        name        = optional(string)
      })))
      title = string
      type  = optional(string)
    })))
  }))
}

