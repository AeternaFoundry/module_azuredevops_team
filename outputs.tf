output "teams_id" {
  description = "Map of id values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.id }
}
output "teams_administrators" {
  description = "Map of administrators values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.administrators }
}
output "teams_area" {
  description = "Map of area values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.area }
}
output "teams_description" {
  description = "Map of description values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.description }
}
output "teams_descriptor" {
  description = "Map of descriptor values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.descriptor }
}
output "teams_members" {
  description = "Map of members values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.members }
}
output "teams_name" {
  description = "Map of name values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.name }
}
output "teams_project_id" {
  description = "Map of project_id values across all teams, keyed the same as var.teams"
  value       = { for k, v in azuredevops_team.teams : k => v.project_id }
}

