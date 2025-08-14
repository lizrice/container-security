# Container Security

* [Read on O'Reilly](https://learning.oreilly.com/library/view/container-security/9781492056690/)
* Support independent bookshops by ordering from [Bookshop.org](https://uk.bookshop.org/a/4184/9781492056706)
* Or order from your local bookshop using ISBN 9781492056706 
* [Buy from Amazon](https://amzn.to/2Rj2on3)

## Table of Contents

1. Container Security Threats
1. [Linux System Calls, Permissions and Capabilities](chapter2/README.md)
1. [Control Groups](chapter3/README.md)
1. Container Isolation
1. Virtual Machines
1. Container Images
1. Supply Chain Security
1. Software Vulnerabilities in Images
1. Infrastructure as Code and GitOps
1. Strengthening Container Isolation
1. Breaking Container Isolation
1. Container Network Security
1. Securely Connecting Components
1. Passing Secrets to Containers
1. Container Runtime Protection
1. Containers and the OWASP Top 10

## Code examples

This repo contains some code examples to accompany the book. You can run them in O'Reilly's sandbox environment or use your own Linux machine or virtual machine. I have tested them on MacOS using Lima running a Ubuntu 24.04 LTS distribution, with the provided `lima.yaml` file:

```
limactl start --name=ubuntu24-04 lima.yaml
```

By default Lima now installs Docker in rootless mode, but for demonstration purposes I have left it in the traditional rootful mode.

## Suggestions, corrections and feedback

Please report any issues, corrections or ideas for the next edition on [GitHub](https://github.com/lizrice/container-security/issues)
