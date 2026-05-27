locals {
  resolved_topic_name = coalesce(var.topic_name, var.name)
}

resource "oci_ons_notification_topic" "this" {
  compartment_id = var.compartment_ocid
  name           = local.resolved_topic_name
  description    = var.topic_description
}

resource "oci_ons_subscription" "this" {
  for_each = var.subscriptions

  compartment_id = var.compartment_ocid
  topic_id       = oci_ons_notification_topic.this.id
  protocol       = upper(each.value.protocol)
  endpoint       = each.value.endpoint
}
