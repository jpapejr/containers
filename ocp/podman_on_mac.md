> Based on these docs https://developers.redhat.com/blog/2020/02/12/podman-for-macos-sort-of/

1. Grab the latest `podman-machine` from https://github.com/boot2podman/machine/releases
2. Provision a new machine `$ podman-machine create --virtualbox-boot2podman-url https://github.com/snowjet/boot2podman-fedora-iso/releases/download/d1bb19f/boot2podman-fedora.iso --virtualbox-memory="4096" --virtualbox-share-folder ~/Downloads:code fedbox
`
3. Get `podman-remote` from https://github.com/boot2podman/libpod/releases
4. Use `$(podman-machine env fedbox --varlink)` to set up the shell and `podman` commands as normal. 


**Note - VirtualBox is needed for this solution**
