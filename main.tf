resource "grafana_apps_servicemodel_component_v1alpha1" "apps_servicemodel_component_v1alpha1s" {
  for_each = var.apps_servicemodel_component_v1alpha1s


  dynamic "metadata" {
    for_each = each.value.metadata != null ? each.value.metadata : []
    content {
      folder_uid = metadata.value.folder_uid
      uid        = metadata.value.uid
    }
  }

  dynamic "options" {
    for_each = each.value.options != null ? each.value.options : []
    content {
      manager_identity = options.value.manager_identity
      overwrite        = options.value.overwrite
    }
  }

  dynamic "spec" {
    for_each = each.value.spec != null ? each.value.spec : []
    content {
      dynamic "depends_on_refs" {
        for_each = spec.value.depends_on_refs != null ? spec.value.depends_on_refs : []
        content {
          api_version = depends_on_refs.value.api_version
          kind        = depends_on_refs.value.kind
          name        = depends_on_refs.value.name
        }
      }
      description = spec.value.description
      dynamic "identifiers" {
        for_each = spec.value.identifiers != null ? spec.value.identifiers : []
        content {
          key   = identifiers.value.key
          value = identifiers.value.value
        }
      }
      dynamic "links" {
        for_each = spec.value.links != null ? spec.value.links : []
        content {
          icon  = links.value.icon
          title = links.value.title
          type  = links.value.type
          url   = links.value.url
        }
      }
      dynamic "owner_ref" {
        for_each = spec.value.owner_ref != null ? spec.value.owner_ref : []
        content {
          api_version = owner_ref.value.api_version
          kind        = owner_ref.value.kind
          name        = owner_ref.value.name
        }
      }
      title = spec.value.title
      type  = spec.value.type
    }
  }
}

