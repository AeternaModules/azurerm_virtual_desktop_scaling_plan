output "virtual_desktop_scaling_plans_id" {
  description = "Map of id values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.id }
}
output "virtual_desktop_scaling_plans_description" {
  description = "Map of description values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.description }
}
output "virtual_desktop_scaling_plans_exclusion_tag" {
  description = "Map of exclusion_tag values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.exclusion_tag }
}
output "virtual_desktop_scaling_plans_friendly_name" {
  description = "Map of friendly_name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.friendly_name }
}
output "virtual_desktop_scaling_plans_host_pool" {
  description = "Map of host_pool values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.host_pool }
}
output "virtual_desktop_scaling_plans_location" {
  description = "Map of location values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.location }
}
output "virtual_desktop_scaling_plans_name" {
  description = "Map of name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.name }
}
output "virtual_desktop_scaling_plans_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.resource_group_name }
}
output "virtual_desktop_scaling_plans_schedule" {
  description = "Map of schedule values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.schedule }
}
output "virtual_desktop_scaling_plans_tags" {
  description = "Map of tags values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.tags }
}
output "virtual_desktop_scaling_plans_time_zone" {
  description = "Map of time_zone values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.time_zone }
}

