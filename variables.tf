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
  # --- Unconfirmed validation candidates, derived from azurerm_virtual_desktop_scaling_plan's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: friendly_name
  #   condition: length(value) >= 1 && length(value) <= 64
  #   message:   must be between 1 and 64 characters
  # path: description
  #   condition: length(value) >= 1 && length(value) <= 512
  #   message:   must be between 1 and 512 characters
  # path: schedule.name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: schedule.days_of_week[*]
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: schedule.ramp_up_load_balancing_algorithm
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: schedule.ramp_up_minimum_hosts_percent
  #   condition: value >= 0 && value <= 100
  #   message:   must be between 0 and 100
  # path: schedule.ramp_up_capacity_threshold_percent
  #   condition: value >= 0 && value <= 100
  #   message:   must be between 0 and 100
  # path: schedule.peak_load_balancing_algorithm
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: schedule.ramp_down_load_balancing_algorithm
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: schedule.ramp_down_minimum_hosts_percent
  #   condition: value >= 0 && value <= 100
  #   message:   must be between 0 and 100
  # path: schedule.ramp_down_capacity_threshold_percent
  #   condition: value >= 0 && value <= 100
  #   message:   must be between 0 and 100
  # path: schedule.ramp_down_stop_hosts_when
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: schedule.off_peak_load_balancing_algorithm
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: host_pool.hostpool_id
  #   source:    [from hostpool.ValidateHostPoolID] !ok
  # path: host_pool.hostpool_id
  #   source:    [from hostpool.ValidateHostPoolID] err != nil
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

