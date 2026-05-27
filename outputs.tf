output "topic_id" {
  description = "OCI ONS topic OCID."
  value       = oci_ons_notification_topic.this.id
}

output "topic_name" {
  description = "Resolved ONS topic name."
  value       = oci_ons_notification_topic.this.name
}

output "topic_description" {
  description = "ONS topic description."
  value       = oci_ons_notification_topic.this.description
}

output "subscription_ids" {
  description = "Map of subscription logical names to created ONS subscription OCIDs."
  value = {
    for key, subscription in oci_ons_subscription.this :
    key => subscription.id
  }
}

output "subscriptions" {
  description = "Map of subscription logical names with protocol, endpoint, and OCID."
  value = {
    for key, subscription in oci_ons_subscription.this :
    key => {
      id       = subscription.id
      protocol = subscription.protocol
      endpoint = subscription.endpoint
    }
  }
}
