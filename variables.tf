variable "group_name" {
  description = "Group name"
  type        = string
  default     = ""
}

variable "description" {
  description = "Permissions set group description"
  type        = string
  default     = ""
}

variable "session_duration" {
  description = "The length of time that the application user sessions are valid in the ISO-8601 standard. Default: PT1H"
  type        = string
  default     = "PT2H"
}

variable "policy_attachment" {
  description = "ARN of the policy attachment"
  type        = list(string)
  default     = []
}

variable "inline_policy" {
  description = "Inline policies JSON to attach to SSO Permissions Set"
  type        = string
  default     = ""
}

#=== Identity Groups ===#
variable "display_name" {
  description = "(Optional) A string containing the name of the group. This value is commonly displayed when the group is referenced"
  type        = string
  default     = ""
}

variable "description_identity" {
  description = "(Optional) A string containing the description of the group."
  type        = string
  default     = ""
}

#=== Account assignment ===#
variable "target_id" {
  description = "(Required, Forces new resource) An AWS account identifier, typically a 10-12 digit string."
  type        = list(string)
}

// Tags
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
