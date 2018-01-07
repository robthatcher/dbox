# dbox

## A script to create & configure an env for doing ops and dev stuff.

### Overview

 *dbox* creates a base environment with some tooling to work on infrastructure, operations and development tasks.

It can currently set up locally or in a virtual machine isolated from your main/laptop/pc OS.

The environment is created via a wrapper script and some provisioning scripts.

### Setup Types

- local machine install
- vagrant linux machine install (non-gui)
- vagrant **desktop** linux install (gui)

### Instructions

#### Setup Script

 1. `git clone <https://repo.url/>` ..
 1. `./dbox.sh -h` 

#### Manual local install

 1. `git clone <https://repo.url/>` ..
 1. run `chmod +x dbox/provisioners/dbox_local.sh`
 1. run script `./dbox/provisioners/dbox_local.sh`
 1. drink coffee/eat pizza until done..

#### Manual vagrant install

 1. `git clone <https://repo.url>` ..
 1. `cd dbox/vagrant-gui` OR `cd dbox/vagrant-nogui`
 1. `vagrant up`

#### Common configurations files

 1. bashrc
 1. screenrc

#### Tested with (2017-09-08)

- macOS Sierra [10.12.6] + Virtualbox [Version 5.1.26 r117224]
- Vagrant [1.9.7]
- Ubuntu desktop [17.04]
- bento/ubuntu17.04
- ubuntu/zesty64

#### Repo layout
```
dbox/
  README.md
  dbox.sh {local/vagrant-gui/vagrant-nogui}
    common/
      *files shared by provisioners
    provisioners/
      *provisioning scripts*
    vagrant-gui/
      *vagrant files*
    vagrant-nogui/
      *vagrant files*
  ```
