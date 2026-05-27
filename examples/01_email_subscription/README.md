# Example 01: Email Subscription

This example shows the smallest useful pattern for the **terraform-oci-fk-ons** module: one topic and one email subscription.

It is useful when you want to validate the module quickly or show the ONS subscription confirmation flow without introducing any additional OCI services.

---

## What This Example Shows

- One reusable ONS topic
- One email subscription
- Minimal module usage with no extra networking or service dependencies

---

## Deploy Using Terraform CLI

```bash
cd examples/01_email_subscription
cp terraform.tfvars.example terraform.tfvars
tofu init
tofu plan
tofu apply
```

After apply, OCI sends a subscription confirmation email to the configured address. The subscription stays pending until the email is confirmed.

---

## Notes

- This example is intentionally simple.
- It is a good first validation step for the module itself.
- Email subscriptions require a manual confirmation step in the recipient mailbox before they become active.

---

## Related Resources

- [Root module](../../README.md)
- [Examples index](../README.md)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../../LICENSE](../../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
