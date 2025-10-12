# Breaking container isolation

## Overriding user ID

The `alpine` and `alpine-bundle` folders and their contents are here to provide convenient examples, and should not be used for running alpine in production as they are almost certainly not the latest versions! 

`alpine` - an OCI-format image for alpine
`alpine-bundle` - a runtime filesystem bundle for alpine, generated from `alpine`

You can try running this with `runc`: 

```
cd alpine-bundle
sudo runc run sh
```

Set the user ID you want to run as in config.json. In this example I have changed it to 5000. 

## No new privileges

```
docker build -t nopriv .
```

Run this container in different ways:
- `docker run -it nopriv` - bash resets the user to non-privilged user
- `docker run -it nopriv -p` - the -p option passed to (my)bash overrides the setuid check, so bash runs as root
- `docker run -it --security-opt no-new-privileges nopriv -p` - the security option prevents the setuid privilege escalation

## References

- p. 124 — [Flux CD](https://fluxcd.io/flux/)
- p. 124 — [Argo CD](https://argoproj.github.io/cd/)
- p. 126 — [OpenGitOps](https://opengitops.dev/)
- p. 126 — [Checkov](https://www.checkov.io/)
- p. 126 — [Conftest](https://www.conftest.dev/)
- p. 126 — [Kubescape](https://kubescape.io/)
- p. 126 — [Trivy](https://trivy.dev/)
- p. 128 — [GitHub Actions: OpenID Connect](https://docs.github.com/en/actions/concepts/security/openid-connect)

[Back to index](../README.md)