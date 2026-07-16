output "virtual_desktop_scaling_plans_id" {
  description = "Map of id values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.id if v.id != null && length(v.id) > 0 }
}
output "virtual_desktop_scaling_plans_description" {
  description = "Map of description values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.description if v.description != null && length(v.description) > 0 }
}
output "virtual_desktop_scaling_plans_exclusion_tag" {
  description = "Map of exclusion_tag values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.exclusion_tag if v.exclusion_tag != null && length(v.exclusion_tag) > 0 }
}
output "virtual_desktop_scaling_plans_friendly_name" {
  description = "Map of friendly_name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.friendly_name if v.friendly_name != null && length(v.friendly_name) > 0 }
}
output "virtual_desktop_scaling_plans_host_pool" {
  description = "Map of host_pool values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.host_pool if v.host_pool != null && length(v.host_pool) > 0 }
}
output "virtual_desktop_scaling_plans_location" {
  description = "Map of location values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.location if v.location != null && length(v.location) > 0 }
}
output "virtual_desktop_scaling_plans_name" {
  description = "Map of name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.name if v.name != null && length(v.name) > 0 }
}
output "virtual_desktop_scaling_plans_resource_group_name" {
  description = "Map of resource_group_name values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "virtual_desktop_scaling_plans_schedule" {
  description = "Map of schedule values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.schedule if v.schedule != null && length(v.schedule) > 0 }
}
output "virtual_desktop_scaling_plans_tags" {
  description = "Map of tags values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "virtual_desktop_scaling_plans_time_zone" {
  description = "Map of time_zone values across all virtual_desktop_scaling_plans, keyed the same as var.virtual_desktop_scaling_plans"
  value       = { for k, v in azurerm_virtual_desktop_scaling_plan.virtual_desktop_scaling_plans : k => v.time_zone if v.time_zone != null && length(v.time_zone) > 0 }
}

