# Examples

This directory contains focused examples for the **terraform-oci-fk-ons** module.

The examples are intentionally small and demonstrate how the ONS module composes with other OCI services without embedding those services directly into the module itself.

---

## Available Examples

| Example | Description |
|-------|-------------|
| `01_email_subscription` | Minimal topic with a single email subscription |
| `02_function_subscription` | Topic subscribed by an existing OCI Function |

---

## Notes

- The examples are meant to be read incrementally.
- `01_email_subscription` is the simplest possible ONS pattern.
- `02_function_subscription` shows how the module plugs into an OCI Functions workflow, which is the pattern used later in the FoggyKitchen Function training materials.

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [../LICENSE](../LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
