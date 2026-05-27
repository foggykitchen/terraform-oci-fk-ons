# terraform-oci-fk-ons

This repository contains a reusable **Terraform/OpenTofu module** and focused examples for deploying **Oracle Cloud Infrastructure (OCI) Notifications Service (ONS)** topics and subscriptions.

It is part of the **[FoggyKitchen.com training ecosystem](https://foggykitchen.com/courses-2/)** and is designed to work cleanly with reusable infrastructure modules such as **`terraform-oci-fk-function`**, **`terraform-oci-fk-api-gateway`**, and future event-driven integration components.

---

## Purpose

The goal of this module is to provide a **clean, composable, and educational reference implementation** for OCI Notifications:

- Focused on OCI-native ONS topic and subscription primitives
- Suitable for Functions, Email, HTTPS, and similar subscription targets
- Designed for hands-on learning, module composition, and event-driven service integration scenarios

This is **not** a workflow engine or messaging abstraction layer. It is a **small, explicit infrastructure module** for OCI Notifications.

---

## What the module does

The module creates:

- OCI Notifications topic
- Zero or more OCI Notifications subscriptions

The module intentionally does **not** create:

- OCI Functions applications or functions
- VCNs or subnets
- IAM policies for publishers or subscribers
- Streams
- Service Connector Hub resources
- API Gateways

Each of those concerns belongs in its own dedicated module.

---

## Repository Structure

```bash
terraform-oci-fk-ons/
├── examples/
│   ├── 01_email_subscription/
│   ├── 02_function_subscription/
│   └── README.md
├── main.tf
├── inputs.tf
├── outputs.tf
├── versions.tf
├── LICENSE
└── README.md
```

The examples are intentionally small and show **incremental Notifications patterns**, starting from a simple email subscription and then moving into OCI Functions integration.

---

## Example Usage

### Email subscription

```hcl
module "ons" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-ons.git?ref=v0.1.0"

  name             = "fk-email-topic"
  compartment_ocid = var.compartment_ocid
  topic_description = "Simple email notification topic"

  subscriptions = {
    email_ops = {
      protocol = "EMAIL"
      endpoint = "ops@example.com"
    }
  }
}
```

### OCI Functions subscription

```hcl
module "ons" {
  source = "git::https://github.com/foggykitchen/terraform-oci-fk-ons.git?ref=v0.1.0"

  name             = "fk-functions-topic"
  compartment_ocid = var.compartment_ocid
  topic_description = "ONS topic subscribed by an OCI Function"

  subscriptions = {
    fncollector = {
      protocol = "ORACLE_FUNCTIONS"
      endpoint = var.function_ocid
    }
  }
}
```

---

## Module Inputs

| Variable | Type | Required | Description |
|--------|------|----------|-------------|
| `name` | `string` | ✅ | Base name used for the topic when `topic_name` is not provided |
| `compartment_ocid` | `string` | ✅ | OCI compartment OCID |
| `topic_name` | `string` | ❌ | Optional explicit topic name override |
| `topic_description` | `string` | ❌ | Topic description |
| `subscriptions` | `map(object({ protocol = string, endpoint = string }))` | ❌ | Subscriptions keyed by logical name |

The module accepts an empty `subscriptions` map when you want to create the topic first and attach subscribers later.

---

## Outputs

| Output | Description |
|------|-------------|
| `topic_id` | ONS topic OCID |
| `topic_name` | Resolved topic name |
| `topic_description` | Topic description |
| `subscription_ids` | Map of logical subscription names to OCIDs |
| `subscriptions` | Map with subscription OCID, protocol, and endpoint |

---

## Examples Overview

| Example | Description |
|-------|-------------|
| `01_email_subscription` | Minimal ONS topic with a single email subscription |
| `02_function_subscription` | ONS topic with an OCI Functions subscription target |

See [`examples/`](examples) for details.

---

## Design Philosophy

- Explicit over implicit
- Small modules over monoliths
- Notifications separated from publishers, subscribers, and networking
- Optimized for **learning, reuse, and composition**

This makes the module ideal for:

- Event-driven Function workflows
- Simple notification fan-out
- OCI service integration workshops
- Multimodule training scenarios

---

## Related Resources

- [FoggyKitchen OCI Function Module (terraform-oci-fk-function)](https://github.com/foggykitchen/terraform-oci-fk-function)
- [FoggyKitchen OCI API Gateway Module (terraform-oci-fk-api-gateway)](https://github.com/foggykitchen/terraform-oci-fk-api-gateway)
- [FoggyKitchen OCI VCN Module (terraform-oci-fk-vcn)](https://github.com/foggykitchen/terraform-oci-fk-vcn)

---

## License

Licensed under the **Universal Permissive License (UPL), Version 1.0**.
See [LICENSE](LICENSE) for details.

---

© 2026 [FoggyKitchen.com](https://foggykitchen.com) - Cloud. Code. Clarity.
