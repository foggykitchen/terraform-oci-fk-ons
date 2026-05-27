variable "tenancy_ocid" {
  description = "OCI tenancy OCID."
  type        = string
}

variable "user_ocid" {
  description = "OCI user OCID."
  type        = string
}

variable "fingerprint" {
  description = "OCI API key fingerprint."
  type        = string
}

variable "private_key_path" {
  description = "Path to the OCI API private key."
  type        = string
}

variable "region" {
  description = "OCI region."
  type        = string
}

variable "compartment_ocid" {
  description = "OCI compartment OCID."
  type        = string
}

variable "email_endpoint" {
  description = "Email address that will receive the subscription confirmation and notifications."
  type        = string
}
