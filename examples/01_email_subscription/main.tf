module "fk_ons" {
  source = "../../"

  name              = "fk-email-topic"
  compartment_ocid  = var.compartment_ocid
  topic_description = "Example topic with an email subscription"

  subscriptions = {
    email_subscription = {
      protocol = "EMAIL"
      endpoint = var.email_endpoint
    }
  }
}
