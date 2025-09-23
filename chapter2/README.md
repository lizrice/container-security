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

## References

 - p. 16 — [A beginner’s guide to syscalls — Liz Rice (O’Reilly, OSCON 2017 video)](https://www.oreilly.com/videos/oscon-2017/9781491976227/9781491976227-video306637/)
- p. 16 — [Wikipedia: “Everything is a file”](https://en.wikipedia.org/wiki/Everything_is_a_file)
- p. 17 — [Linux Journal: Mastering Linux File Permissions and Ownership](https://www.linuxjournal.com/content/mastering-linux-file-permissions-and-ownership)
- p. 21 — [Root your Docker host in 10 seconds for fun and profit (Electricmonk.nl)](https://www.electricmonk.nl/log/2017/09/30/root-your-docker-host-in-10-seconds-for-fun-and-profit/)
- p. 21 — [setuid example](./setuid/README.md)
- p. 23 — [Adrian Mouat: Why Linux Capabilities Exist and How They Work](https://adrianmouat.com/posts/linux-capabilities-why-they-exist-and-how-they-work/)
- p. 23 — [CERT-EU Security Advisory 2018-022: Apache Struts](https://cert.europa.eu/static/SecurityAdvisories/2018/CERT-EU-SA2018-022.pdf)
- p. 23 — [BleepingComputer: Critical Apache Struts RCE vulnerability wasn’t fully fixed, patch now](https://www.bleepingcomputer.com/news/security/critical-apache-struts-rce-vulnerability-wasnt-fully-fixed-patch-now/)
- p. 23 — [BleepingComputer: New critical Apache Struts flaw exploited to find vulnerable servers](https://www.bleepingcomputer.com/news/security/new-critical-apache-struts-flaw-exploited-to-find-vulnerable-servers/)

[Back to index](../README.md)