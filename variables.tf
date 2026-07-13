variable "virtual_desktop_scaling_plans" {
  description = <<EOT
Map of virtual_desktop_scaling_plans, attributes below
Required:
    - location
    - name
    - resource_group_name
    - time_zone
    - schedule (block):
        - days_of_week (required)
        - name (required)
        - off_peak_load_balancing_algorithm (required)
        - off_peak_start_time (required)
        - peak_load_balancing_algorithm (required)
        - peak_start_time (required)
        - ramp_down_capacity_threshold_percent (required)
        - ramp_down_force_logoff_users (required)
        - ramp_down_load_balancing_algorithm (required)
        - ramp_down_minimum_hosts_percent (required)
        - ramp_down_notification_message (required)
        - ramp_down_start_time (required)
        - ramp_down_stop_hosts_when (required)
        - ramp_down_wait_time_minutes (required)
        - ramp_up_capacity_threshold_percent (optional)
        - ramp_up_load_balancing_algorithm (required)
        - ramp_up_minimum_hosts_percent (optional)
        - ramp_up_start_time (required)
Optional:
    - description
    - exclusion_tag
    - friendly_name
    - tags
    - host_pool (block):
        - hostpool_id (required)
        - scaling_plan_enabled (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    time_zone           = string
    description         = optional(string)
    exclusion_tag       = optional(string)
    friendly_name       = optional(string)
    tags                = optional(map(string))
    schedule = list(object({
      days_of_week                         = set(string)
      name                                 = string
      off_peak_load_balancing_algorithm    = string
      off_peak_start_time                  = string
      peak_load_balancing_algorithm        = string
      peak_start_time                      = string
      ramp_down_capacity_threshold_percent = number
      ramp_down_force_logoff_users         = bool
      ramp_down_load_balancing_algorithm   = string
      ramp_down_minimum_hosts_percent      = number
      ramp_down_notification_message       = string
      ramp_down_start_time                 = string
      ramp_down_stop_hosts_when            = string
      ramp_down_wait_time_minutes          = number
      ramp_up_capacity_threshold_percent   = optional(number)
      ramp_up_load_balancing_algorithm     = string
      ramp_up_minimum_hosts_percent        = optional(number)
      ramp_up_start_time                   = string
    }))
    host_pool = optional(list(object({
      hostpool_id          = string
      scaling_plan_enabled = bool
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        length(v.schedule) >= 1
      )
    ])
    error_message = "Each schedule list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        v.friendly_name == null || (length(v.friendly_name) >= 1 && length(v.friendly_name) <= 64)
      )
    ])
    error_message = "must be between 1 and 64 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        v.description == null || (length(v.description) >= 1 && length(v.description) <= 512)
      )
    ])
    error_message = "must be between 1 and 512 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        alltrue([for item in v.schedule : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        alltrue([for item in v.schedule : (item.ramp_up_minimum_hosts_percent == null || (item.ramp_up_minimum_hosts_percent >= 0 && item.ramp_up_minimum_hosts_percent <= 100))])
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        alltrue([for item in v.schedule : (item.ramp_up_capacity_threshold_percent == null || (item.ramp_up_capacity_threshold_percent >= 0 && item.ramp_up_capacity_threshold_percent <= 100))])
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        alltrue([for item in v.schedule : (item.ramp_down_minimum_hosts_percent >= 0 && item.ramp_down_minimum_hosts_percent <= 100)])
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        alltrue([for item in v.schedule : (item.ramp_down_capacity_threshold_percent >= 0 && item.ramp_down_capacity_threshold_percent <= 100)])
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.virtual_desktop_scaling_plans : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

