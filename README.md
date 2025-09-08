# Azure Landing Zone using Terraform

This repository provides Infrastructure as Code (IaC) templates and module examples for deploying a secure, scalable, and production-ready Azure Landing Zone using Terraform. It follows Microsoft Cloud Adoption Framework (CAF) best practices to help organizations quickly set up a foundational Azure environment with networking, security, governance, and resource organization.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture Diagram](#architecture-diagram)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Customization](#customization)
- [Best Practices](#best-practices)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

The Azure Landing Zone provides a starting point for Azure adoption, ensuring that resources are deployed securely and in compliance with organizational policies. The Terraform modules in this repository automate the creation of key components such as management groups, subscriptions, networking (virtual networks, subnets, firewalls), identity (Azure AD integration), policies, and monitoring.

---

## Features

- Modular Terraform code for reusability and scalability
- Network topology with hub & spoke architecture
- Role-based access control (RBAC)
- Policy assignment for governance
- Diagnostic settings & monitoring
- Integration with Azure Security Center
- Support for multiple environments (Dev, Test, Prod)

---

## Architecture Diagram

Below is a high-level diagram of the Azure Landing Zone deployed by this repository:

```
                +----------------------------------------------------------+
                |                    Management Group                      |
                +--------------------------+-------------------------------+
                                           |
                                           v
                      +--------------------+--------------------+
                      | Azure Subscription (Landing Zone)       |
                      +--------------------+--------------------+
                                           |
                                           v
            +------------------+        +---------------------+        +------------------+
            | Hub Network      |<------>| Spoke Network(s)    |<------>| Workloads        |
            +------------------+        +---------------------+        +------------------+
                   |                        |       |     ...        |
                   v                        v       v                v
        +---------------------+   +---------------------+  +---------------------+
        | Firewall / NVA      |   | Subnets             |  | App Services/VMs    |
        +---------------------+   +---------------------+  +---------------------+

         | Identity, Policies, Security, Monitoring, Logging, Cost Management |
         +-------------------------------------------------------------------+
```

---

## Getting Started

To deploy an Azure Landing Zone:

1. **Clone the Repository**
    ```bash
    git clone https://github.com/NitanshuSingh/AzureLandingZone-Terraform.git
    cd AzureLandingZone-Terraform
    ```

2. **Update Variables**
    Edit the `variables.tf` file and provide your Azure configuration (resource names, regions, etc.).

3. **Initialize Terraform**
    ```bash
    terraform init
    ```

4. **Plan Deployment**
    ```bash
    terraform plan
    ```

5. **Apply Deployment**
    ```bash
    terraform apply
    ```

---

## Prerequisites

- [Terraform](https://www.terraform.io/) >= 1.0
- Azure CLI or Service Principal credentials
- Contributor or Owner access to target Azure Subscription

---

## Usage

- Modular code allows you to include only the required components.
- Example usage files are provided in the `examples/` directory.
- Customize `main.tf` to suit your organization's needs.

---

## Customization

- Integrate additional modules (e.g., monitoring, logging, security).
- Define custom policies and role assignments.
- Extend hub & spoke topology for more environments.

---

## Best Practices

- Use remote state storage (e.g., Azure Storage Account) for Terraform state files.
- Implement CI/CD pipelines for automated deployment.
- Regularly review assigned policies and RBAC configurations.
- Monitor costs and optimize resource usage.

---

## Contributing

Contributions are welcome! Please submit issues, feature requests, or pull requests via GitHub.

---

## License

This project is licensed under the MIT License.