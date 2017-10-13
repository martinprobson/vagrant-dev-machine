Vagrant dev machine for scala/java/python
=========================================

# Introduction

This is a vagrant project to build and spin up a VM with the following: -

* Ubuntu 16.04 base box
* Java 8 (OpenJDK)
* XFCE4 desktop
* Eclipse Oxygen with: -
    - Scala IDE
    - Java IDE
    - pydev
    - Eclipse colour theme plugin
* Firefox
* Python Miniconda installation

# Getting Started

1. [Download and install VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. [Download and install Vagrant](http://www.vagrantup.com/downloads.html).
3. Go to [releases](https://github.com/martinprobson/dev-machine/releases) and download and extract the latest source of this project.
5. In your terminal change your directory into the project directory (i.e. `cd dev-machine` )
6. Run ```vagrant up``` to create the VM.
7. Execute ```vagrant ssh``` to login to the VM or login to XFCE via virtualbox.

 **NOTE** This machine will take a significant time to provision initially whilst it downloads and builds the packages required.

# User id

The user id of the VM is `ubuntu` with a password of `ubuntu`.

# Shared Folder

Vagrant automatically mounts the folder containing the Vagrant file from the host machine into
the guest machine as `/vagrant` inside the guest.


# Managment of Vagrant VM

To stop the VM and preserve all setup/data within the VM: -

```
vagrant halt
```

or

```
vagrant suspend
```

Issue a `vagrant up` command again to restart the VM from where you left off.

To completely **wipe** the VM so that `vagrant up` command gives you a fresh machine: -

```
vagrant destroy
```

Then issue `vagrant up` command as usual.

# VIM

A nicer version of vim is also installed, use :PluginInstall to install the plugins from within vim itself.

# Known Issues/To Do

1. Running `vagrant provision` multiple times can cause issues - need to fix.
2. Java heapsize in Eclipse needs to be adjusted to run Scala IDE - Eclipse shows you how to do this on first startup.

# Credits

Thanks to [Budhaditya](https://github.com/budhash) for the [silent eclipse](https://github.com/budhash/install-eclipse) install script.
