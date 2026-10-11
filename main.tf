data "oci_database_management_managed_database_user_roles" "database_management_managed_database_user_roles_lookup" {
  for_each = var.database_management_managed_database_user_roles_lookup

  managed_database_id     = each.value.managed_database_id
  user_name               = each.value.user_name
  name                    = each.value.name
  opc_named_credential_id = each.value.opc_named_credential_id

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

