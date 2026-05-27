module "fk_ons" {
  source = "../../"

  name              = "fk-function-topic"
  compartment_ocid  = var.compartment_ocid
  topic_description = "Example topic subscribed by an OCI Function"

  subscriptions = {
    function_subscription = {
      protocol = "ORACLE_FUNCTIONS"
      endpoint = var.function_ocid
    }
  }
}
