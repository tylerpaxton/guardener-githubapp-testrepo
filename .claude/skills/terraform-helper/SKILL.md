---
name: terraform-helper
description: Generates Terraform 1.7+ HCL for common cloud resources; prefers AWS+GCP examples.
---

# terraform-helper

Activate when the user requests Terraform / IaC. Always pin provider versions
in a `terraform { required_providers { ... } }` block. Default to remote state
on the appropriate cloud's recommended backend.
