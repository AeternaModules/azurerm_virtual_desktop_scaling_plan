output "virtual_desktop_scaling_plans" {
  description = "All virtual_desktop_scaling_plan resources"
  value       = azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans
}
output "virtual_desktop_scaling_plans_description" {
  description = "List of description values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.description]
}
output "virtual_desktop_scaling_plans_exclusion_tag" {
  description = "List of exclusion_tag values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.exclusion_tag]
}
output "virtual_desktop_scaling_plans_friendly_name" {
  description = "List of friendly_name values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.friendly_name]
}
output "virtual_desktop_scaling_plans_host_pool" {
  description = "List of host_pool values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.host_pool]
}
output "virtual_desktop_scaling_plans_location" {
  description = "List of location values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.location]
}
output "virtual_desktop_scaling_plans_name" {
  description = "List of name values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.name]
}
output "virtual_desktop_scaling_plans_resource_group_name" {
  description = "List of resource_group_name values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.resource_group_name]
}
output "virtual_desktop_scaling_plans_schedule" {
  description = "List of schedule values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.schedule]
}
output "virtual_desktop_scaling_plans_tags" {
  description = "List of tags values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.tags]
}
output "virtual_desktop_scaling_plans_time_zone" {
  description = "List of time_zone values across all virtual_desktop_scaling_plans"
  value       = [for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : v.time_zone]
}

