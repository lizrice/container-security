# Linux System Calls, Permissions, and Capabilities

You will need to be running as a normal, non-privileged user (not root) for these examples to make any sense.

## _setuid_

```
# Check that you aren't root already 
whoami 

# Do this in your home directory
ch ~

# Look at permissions and ownership for the sleep executable
ls -l $(which sleep)

# Make your own copy and look at its ownership 
cp /usr/bin/sleep .
ls -l mysleep

# Run this copy
./mysleep 100
```

Open a second terminal and look at the executable you just started

```
ps -fC mysleep
```

Go back to terminal 1 and stop the executable if it's still running. Now let's make it a _setuid_ file owned by root.

```
sudo chown root ./mysleep
sudo chmod +s ./mysleep
ls -l mysleep

# Run it again 
./mysleep 100
```

From the second terminal:

```
ps -fC mysleep 
```

This process should be running under root, not your normal user ID.

### Use a _setuid_ executable to escalate privileges

You can take advantage of _setuid_ to escalate privileges from a container, as shown in [this example](./setuid/README.md)


## Linux Capabilities

```
# Capabilities on a file
getcap $(which ping)

# Capabilities on a process
getpcaps $(pgrep journal)

# A process with no capabilities
getpcaps $$
```

[Back to index](../README.md)