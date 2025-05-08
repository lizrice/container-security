# Explore the no-new-privileges security option

Build the Dockerfile:

```
docker build -f nopriv.Dockerfile -t nopriv .
```

By default the container runs as a user called `myuser`.

```
$ docker run -it nopriv
mybash-5.2$ id
uid=1001(myuser) gid=1001(myuser) groups=1001(myuser)
```

Get a privilege escalation by specifying the `-p` option:

```
$ docker run -it nopriv -p
mybash-5.2# whoami 
root
mybash-5.2# id
uid=1001(myuser) gid=1001(myuser) euid=0(root) groups=1001(myuser)
```

Prevent the privilege escalation by specifying the no-new-privileges security option:

```
$ docker run -it --security-opt no-new-privileges nopriv -p
myuser@e731e9ac6d6c:/$ whoami
myuser
myuser@e731e9ac6d6c:/$ id
uid=1001(myuser) gid=1001(myuser) groups=1001(myuser)
```
