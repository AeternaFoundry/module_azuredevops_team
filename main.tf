resource "azuredevops_team" "teams" {
  for_each = var.teams

  name           = each.value.name
  project_id     = each.value.project_id
  administrators = each.value.administrators
  description    = each.value.description
  members        = each.value.members

  dynamic "area" {
    for_each = each.value.area != null ? each.value.area : []
    content {
      include_children = area.value.include_children
      is_default       = area.value.is_default
      path             = area.value.path
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

