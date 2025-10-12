# Container Images 

## Experiment with secrets built into a Dockerfile

Build the Dockerfile:

```
docker build -t sensitive .
```

If you run `docker run --rm -it sensitive ls /password.txt`, the sensitive password is not included in the filesystem, but that doesn't mean it's not included in the image! 

## Use secret mounts

```
docker build --secret id=MY_SECRET,source=secret.txt -t not-sensitive -f secret.Dockerfile .
```

## References

- p. 70 — [Kubernetes docs: Configure Pods and Containers](https://kubernetes.io/docs/tasks/configure-pod-container/)
- p. 71 — [Open Container Initiative](https://opencontainers.org)
- p. 71 — [Skopeo](https://github.com/containers/skopeo)
- p. 72 — [Filesystem bundle from OCI runtime-spec](https://github.com/opencontainers/runtime-spec/blob/main/bundle.md)
- p. 72 — [umoci](https://github.com/opencontainers/umoci)
- p. 72 — [umoci rootless](https://umo.ci/quick-start/rootless/)
- p. 75 - [Podman: A more secure way to run containers](https://opensource.com/article/18/10/podman-more-secure-way-run-containers)
- p. 75 — [Docker Build: build drivers](https://docs.docker.com/build/builders/drivers/)
- p. 75 — [Docker rootless mode](https://github.com/moby/buildkit/blob/master/docs/rootless.md)
- p. 74 — [Podman](https://podman.io)
- p. 75 — [Buildah](https://buildah.io)
- p. 75 - [Building Container Images with Podman and Buildah](https://www.giantswarm.io/blog/building-container-images-with-podman-and-buildah)
- p. 75 — [Bazel](https://bazel.build)
- p. 75 — [NixOS](https://nixos.org/)
- p. 75 — [ko](https://ko.build/)
- p. 75 — [Jib: getting started](https://cloud.google.com/java/getting-started/jib)
- p. 75 — [GitLab CI: Build images in rootless mode with BuildKit](https://docs.gitlab.com/ci/docker/using_buildkit/#build-images-in-rootless-mode)
- p. 76 — [Images and Layers](https://docs.docker.com/engine/storage/drivers/)
- p. 76 — [Spot the Docker difference. Can you use the Docker Registry to…](https://medium.com/microscaling-systems/spot-the-docker-difference-can-you-use-the-docker-registry-to-12c2fdb2f1ad)
- p. 79 — [Docker Build: build secrets](https://docs.docker.com/build/building/secrets/)
- p. 80 — [Harbor](https://goharbor.io/)
- p. 80 — [Docker Hub](https://hub.docker.com)


[Back to index](../README.md)