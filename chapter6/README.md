# Experiment with secrets built into a Dockerfile

Build the Dockerfile:

```
docker build -t sensitive .
```

If you run `docker run --rm -it sensitive ls /password.txt`, the sensitive password is not included in the filesystem, but that doesn't mean it's not included in the image! 

## Use secret mounts

```
docker build --secret id=MY_SECRET,source=secret.txt -t not-sensitive -f secret.Dockerfile .
```

