# 🔐 Container Security 🔐 - 2nd edition out now! 

* Read on O'Reilly
  * **New!** [Second edition](https://learning.oreilly.com/library/view/container-security-2nd/9798341627697/)
  * [First edition](https://learning.oreilly.com/library/view/container-security/9781492056690/)
* Support independent bookshops by ordering from [Bookshop.org](https://bookshop.org/p/books/container-security-fundamental-technology-concepts-that-protect-cloud-native-applications-liz-rice/011577f647ffe30f?ean=9798341627703&next=t)
* Or order from your local bookshop
  * Second edition: ISBN 9798341627673
  * First edition: ISBN 9781492056706 
* [Buy from Amazon](https://amzn.to/2Rj2on3)

## Table of Contents

1. [Container Security Threats](chapter1/README.md)
1. [Linux System Calls, Permissions and Capabilities](chapter2/README.md)
1. [Control Groups](chapter3/README.md)
1. [Container Isolation](chapter4/README.md)
1. [Virtual Machines](chapter5/README.md)
1. [Container Images](chapter6/README.md)
1. [Supply Chain Security](chapter7/README.md)
1. [Software Vulnerabilities in Images](chapter8/README.md)
1. [Infrastructure as Code and GitOps](chapter9/README.md)
1. [Strengthening Container Isolation](chapter10/README.md)
1. [Breaking Container Isolation](chapter11/README.md)
1. [Container Network Security](chapter12/README.md)
1. [Securely Connecting Components](chapter13/README.md)
1. [Passing Secrets to Containers](chapter14/README.md)
1. [Container Runtime Protection](chapter15/README.md)
1. [Containers and the OWASP Top 10](chapter16/README.md)

## Code examples

This repo contains some code examples to accompany the book. You can run them in O'Reilly's sandbox environment or use your own Linux machine or virtual machine. I have tested them on MacOS using Lima running a Ubuntu 24.04 LTS distribution, with the provided `lima.yaml` file:

```
limactl start --name=ubuntu24-04 lima.yaml
```

By default Lima now installs Docker in rootless mode, but for demonstration purposes I have left it in the traditional rootful mode.

## References

If you have the print edition of the book, URLs are tedious to type in, so I have included links under a References section for each chapter. 

## Suggestions, corrections and feedback

Please report any issues, corrections or ideas for the next edition on [GitHub](https://github.com/lizrice/container-security/issues)
