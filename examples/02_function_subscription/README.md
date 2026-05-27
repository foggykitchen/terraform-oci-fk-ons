# Example 02: Function Subscription

This example shows how the **terraform-oci-fk-ons** module integrates with an **existing OCI Function** by subscribing the function to an ONS topic.

This is the pattern used later in the FoggyKitchen Function lessons, where one function publishes to ONS and another function is triggered asynchronously through the topic subscription.

---

## What This Example Shows

- One reusable ONS topic
- One `ORACLE_FUNCTIONS` subscription
- Clean separation between the ONS module and the function implementation itself

---

## Deploy Using Terraform CLI

```bash
cd examples/02_function_subscription
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

This example expects an already existing OCI Function OCID. It does not create the function itself.

---

## Notes

- The module is intentionally responsible only for the topic and the subscription.
- The subscriber function, its application, IAM, and networking should be composed through dedicated modules such as `terraform-oci-fk-function`.
- This keeps the eventing layer explicit and reusable.

---

## Related Resources

- [Root module](../../README.md)
- [Examples index](../README.md)
- [FoggyKitchen OCI Function Module](https://github.com/foggykitchen/terraform-oci-fk-function)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../../LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
