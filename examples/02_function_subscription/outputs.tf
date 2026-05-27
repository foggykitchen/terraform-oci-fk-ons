output "topic_id" {
  description = "Created ONS topic OCID."
  value       = module.fk_ons.topic_id
}

output "subscription_ids" {
  description = "Created ONS subscription IDs."
  value       = module.fk_ons.subscription_ids
}
