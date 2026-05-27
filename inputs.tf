variable "name" {
  description = "Base name used for the ONS topic when topic_name is not provided explicitly."
  type        = string

  validation {
    condition     = trimspace(var.name) != ""
    error_message = "name must not be empty."
  }
}

variable "compartment_ocid" {
  description = "OCI compartment OCID where the topic and subscriptions will be created."
  type        = string

  validation {
    condition     = trimspace(var.compartment_ocid) != ""
    error_message = "compartment_ocid must not be empty."
  }
}

variable "topic_name" {
  description = "Optional explicit name for the ONS topic. Defaults to name."
  type        = string
  default     = null
}

variable "topic_description" {
  description = "Optional description for the ONS topic."
  type        = string
  default     = "FoggyKitchen OCI Notification topic"
}

variable "subscriptions" {
  description = "Map of subscriptions keyed by logical name. Each subscription must define protocol and endpoint."
  type = map(object({
    protocol = string
    endpoint = string
  }))
  default = {}

  validation {
    condition = alltrue([
      for subscription in values(var.subscriptions) :
      trimspace(subscription.protocol) != "" && trimspace(subscription.endpoint) != ""
    ])
    error_message = "Each subscription must define non-empty protocol and endpoint values."
  }
}
