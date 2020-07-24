> Based on these docs https://developers.redhat.com/blog/2020/02/12/podman-for-macos-sort-of/

1. Grab the latest `podman-machine` from https://github.com/boot2podman/machine/releases
2. Provision a new machine `$ podman-machine create --virtualbox-boot2podman-url https://github.com/snowjet/boot2podman-fedora-iso/releases/download/d1bb19f/boot2podman-fedora.iso --virtualbox-memory="4096" --virtualbox-share-folder ~/Downloads:code fedbox
`
3. Run `podman` commands with ` sudo ./podman --remote-host $(podman-machine ip fedbox) --username tc $(podman-machine config fedbox | grep iden) <command> ` and **profit**.


For easy access to step 3 - create an alias or a script at `/usr/local/bin/podman` that calls the command in step 3
