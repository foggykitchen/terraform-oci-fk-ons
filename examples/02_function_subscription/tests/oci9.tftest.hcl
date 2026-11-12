# Synthetic fixtures only. Every run is plan-only; no tenancy credentials are used.
mock_provider "oci" {
  mock_resource "oci_ons_notification_topic" {
    defaults = { "api_endpoint" = "mock-value", "etag" = "mock-value", "id" = "MOCK_OCID_TOPIC", "short_topic_id" = "MOCK_OCID_MOCK", "state" = "AVAILABLE", "time_created" = "mock-value", "topic_id" = "MOCK_OCID_MOCK" }
  }
  mock_resource "oci_ons_subscription" {
    defaults = { "created_time" = "mock-value", "etag" = "mock-value", "id" = "MOCK_OCID_SUBSCRIPTION", "state" = "AVAILABLE" }
  }
}
variables {
  tenancy_ocid     = "MOCK_OCID_TENANCY"
  user_ocid        = "MOCK_OCID_MOCK"
  fingerprint      = "compatibility"
  private_key_path = "/unused-by-mock"
  region           = "eu-frankfurt-1"
  compartment_ocid = "MOCK_OCID_COMPARTMENT"
  function_ocid    = "MOCK_OCID_MOCK"
}

run "oci9_plan" {
  command = plan
}
