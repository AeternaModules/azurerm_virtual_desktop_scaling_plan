resource "azurerm_virtual_desktop_scaling_plan" "virtual_desktop_scaling_plans" {
  for_each = var.virtual_desktop_scaling_plans

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  time_zone           = each.value.time_zone
  description         = each.value.description
  exclusion_tag       = each.value.exclusion_tag
  friendly_name       = each.value.friendly_name
  tags                = each.value.tags

  schedule {
    days_of_week                         = each.value.schedule.days_of_week
    name                                 = each.value.schedule.name
    off_peak_load_balancing_algorithm    = each.value.schedule.off_peak_load_balancing_algorithm
    off_peak_start_time                  = each.value.schedule.off_peak_start_time
    peak_load_balancing_algorithm        = each.value.schedule.peak_load_balancing_algorithm
    peak_start_time                      = each.value.schedule.peak_start_time
    ramp_down_capacity_threshold_percent = each.value.schedule.ramp_down_capacity_threshold_percent
    ramp_down_force_logoff_users         = each.value.schedule.ramp_down_force_logoff_users
    ramp_down_load_balancing_algorithm   = each.value.schedule.ramp_down_load_balancing_algorithm
    ramp_down_minimum_hosts_percent      = each.value.schedule.ramp_down_minimum_hosts_percent
    ramp_down_notification_message       = each.value.schedule.ramp_down_notification_message
    ramp_down_start_time                 = each.value.schedule.ramp_down_start_time
    ramp_down_stop_hosts_when            = each.value.schedule.ramp_down_stop_hosts_when
    ramp_down_wait_time_minutes          = each.value.schedule.ramp_down_wait_time_minutes
    ramp_up_capacity_threshold_percent   = each.value.schedule.ramp_up_capacity_threshold_percent
    ramp_up_load_balancing_algorithm     = each.value.schedule.ramp_up_load_balancing_algorithm
    ramp_up_minimum_hosts_percent        = each.value.schedule.ramp_up_minimum_hosts_percent
    ramp_up_start_time                   = each.value.schedule.ramp_up_start_time
  }

  dynamic "host_pool" {
    for_each = each.value.host_pool != null ? [each.value.host_pool] : []
    content {
      hostpool_id          = host_pool.value.hostpool_id
      scaling_plan_enabled = host_pool.value.scaling_plan_enabled
    }
  }
}

