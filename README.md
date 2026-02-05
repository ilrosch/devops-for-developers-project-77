# Deploy using the infrastructure-as-code model

[![Actions Status](https://github.com/ilrosch/devops-for-developers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/ilrosch/devops-for-developers-project-77/actions) ![Upmon](https://app.upmon.com/badge/ae8c4321-3833-4133-b4ea-474c86e79415/rbq3lmy7-2.svg)

Deploy infrastructure and Redmine application.

[DEMO - click here!](http://ilrosch.ru/)

---

## Requirements

- **Python** >= 3.12
- **Ansible** >= 2.20
- **Terraform** >= 1.15
- **Yandex Cloud**
- **Make**

---

## Get started

Deploy infrastructure and application with one command:

```
make setup
```

Other command:

- [README with Ansible commands](https://github.com/ilrosch/devops-for-developers-project-77/tree/blob/main/ansible/README.md)

- [README with Terraform commands](https://github.com/ilrosch/devops-for-developers-project-77/tree/blob/main/terraform/README.md)

```
make ansible-deploy     # Deploy only application

make ansible-destroy    # Destroy only application

make tf-deploy          # Deploy only infrastructure

make tf-destroy         # Destroy all
```

---

## Example

Deploy:

[![asciicast](https://asciinema.org/a/YzaN1XYz3e53kXRS.svg)](https://asciinema.org/a/YzaN1XYz3e53kXRS)

Destroy:

[![asciicast](https://asciinema.org/a/0N6thitkkyZFBhxL.svg)](https://asciinema.org/a/0N6thitkkyZFBhxL)
