# Control Groups 

You will need to run these examples as root. 

```
sudo -s
```

```
# Go to the cgroups directory and take a look at its contents
cd /sys/fs/cgroup
ls

# Look at the controllers 
cat cgroup.controllers
```

## Create a cgroup

You can call your cgroup whatever you want.

```
export CGROUP=liz
```

Create a cgroup:

```
mkdir $CGROUP
ls $CGROUP
```

Set a memory limit for this cgroup:

```
# How much memory can this cgroup use?
cat $CGROUP/memory.max

# Configure a memory limit
echo 100000 > $CGROUP/memory.max
cat $CGROUP/memory.max
```

In a second terminal, find the current process ID of its shell. You are going to limit the amount of memory that shell can use by adding it to your control group.

```
echo $$
```

Back in the first terminal:

```
export PID=<process ID you just obtained from the second terminal>
```

```
# Add the process of the second shell to your cgroup 
echo $PID > $CGROUP/cgroup.procs

# Check this process is now a member of that cgroup
cat $CGROUP/cgroup.procs

# And look at the cgroup for that process
cat /proc/$PID/cgroup
```

Now if you go back to the shell in the second terminal, it is very restricted in what it can do. For example, even running `ls` requires more memory than the cgroup allows, so the process will get killed.

## Docker using cgroups

```
# Start a container in the background, and leave it sleeping for a while
docker run -d alpine sleep 1000

# Look at the ID for this container 
docker ps

# Look at the cgroups - you should find one corresponding to that container
ls -d system.slice/docker*
```

## Prevent a fork bomb

```
# Reset the memory limit for the cgroup you created earlier
echo max > $CGROUP/memory.max

# Constrain this cgroup to 20 processes
echo 20 > $CGROUP/pids.max

# Add the current process to the cgroup
echo $$ > $CGROUP/cgroup.procs

# How many processes are currently running in it? 
cat $CGROUP/pids.current
```

You'll need another terminal where you can kill the fork-bombed cgroup. `sudo -s` so that you are root in this terminal. This shell doesn't already have the CGROUP environment variable, so you'll have to enter that manually with `export CGROUP=<cgroup name>`

```
# It's a good idea to double-check that shell's process ID is a member of the cgroup that has process limits set
cat /sys/fs/cgroup/$CGROUP/cgroup.procs
cat /sys/fs/cgroup/$CGROUP/pids.max
```

If you're feeling brave, you can run a fork bomb *in the first terminal*.

```
:(){ :|:& };:
```

Although that cgroup is overwhelmed, the rest of the machine should not be. To kill the fork bomb cgroup go back to the second terminal.

```
echo 1 > /sys/fs/cgroup/$CGROUP/cgroup.kill 
```

## Fork bomb in a constrained Docker container

```
docker run --pids-limit 20 --name forkbomb -it ubuntu 
```

Run the fork bomb inside this container. You can stop it from another terminal with `docker stop forkbomb`

## References

- p. 27 - [Wikipedia: Resource exhaustion attack](https://en.wikipedia.org/wiki/Resource_exhaustion_attack)
- p. 30 — [Kubernetes docs: Managing resources for containers](https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/)  
- p. 30 — [Liz Rice — What Have Namespaces Done For You Lately](https://www.youtube.com/watch?v=MHv6cWjvQjM&ab_channel=Docker)  
- p. 31 — [Kubernetes docs: Process ID (PID) limiting](https://kubernetes.io/docs/concepts/policy/pid-limiting/)  

[Back to index](../README.md)