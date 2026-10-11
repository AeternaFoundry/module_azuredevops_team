variable "teams" {
  description = <<EOT
Map of teams, attributes below
Required:
    - name
    - project_id
Optional:
    - administrators
    - description
    - members
    - area (block):
        - include_children (optional)
        - is_default (optional)
        - path (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    name           = string
    project_id     = string
    administrators = optional(set(string))
    description    = optional(string)
    members        = optional(set(string))
    area = optional(list(object({
      include_children = optional(bool)
      is_default       = optional(bool)
      path             = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.project_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        length(trimspace(v.name)) > 0
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        v.description == null || (length(v.description) >= 0 && length(v.description) <= 256)
      )
    ])
    error_message = "must be between 0 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        v.administrators == null || (alltrue([for x in v.administrators : length(trimspace(x)) > 0]))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        v.members == null || (alltrue([for x in v.members : length(trimspace(x)) > 0]))
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
  validation {
    condition = alltrue([
      for k, v in var.teams : (
        v.area == null || alltrue([for item in v.area : (length(trimspace(item.path)) > 0)])
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
}

