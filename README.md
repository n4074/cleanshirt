# cleanshirt

A nixOS configuration and packer script for provisioning a basic machine to my likeing.

The packer specification expects an ssh keypair in a predefined location — this is only used during the initial installation and isn't copied to the built machine — which you will need to generate (e.g. `ssh-keygen -t ed25519 -a 1000 -f ./provisioning/ssh.key -N "" -C ""`).

Currently only a VMWare ISO builder is implemented, which requires Workstation or Fusion to be installed.

## Building
```shell
packer build -var vm_name=SomeVM nixos.json
```
