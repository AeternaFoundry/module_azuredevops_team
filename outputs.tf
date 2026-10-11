output "teams_id" {
  description = "Map of id values across all teams, keyed the same as var.teams except keys with no id are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.id if v.id != null && length(v.id) > 0 }
}
output "teams_administrators" {
  description = "Map of administrators values across all teams, keyed the same as var.teams except keys with no administrators are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.administrators if v.administrators != null && length(v.administrators) > 0 }
}
output "teams_area" {
  description = "Map of area values across all teams, keyed the same as var.teams except keys with no area are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.area if v.area != null && length(v.area) > 0 }
}
output "teams_description" {
  description = "Map of description values across all teams, keyed the same as var.teams except keys with no description are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.description if v.description != null && length(v.description) > 0 }
}
output "teams_descriptor" {
  description = "Map of descriptor values across all teams, keyed the same as var.teams except keys with no descriptor are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.descriptor if v.descriptor != null && length(v.descriptor) > 0 }
}
output "teams_members" {
  description = "Map of members values across all teams, keyed the same as var.teams except keys with no members are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.members if v.members != null && length(v.members) > 0 }
}
output "teams_name" {
  description = "Map of name values across all teams, keyed the same as var.teams except keys with no name are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.name if v.name != null && length(v.name) > 0 }
}
output "teams_project_id" {
  description = "Map of project_id values across all teams, keyed the same as var.teams except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_team.teams : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}

