# Inception_of_Things

## Part 1: K3s and Vagrant

Set up 2 machines
- 1 CPU, 512MB of RAM, Vagrant
- write a Vagrantfile using the latest stable version of any OS distribution

- Machines Hostname:
    1- manki_S
    2- manki_SW

- Have a dedicated IP on the eth1 interface:
    1- manki_S => 192.168.56.110
    2- manki_SW => 192.168.56.111

- Be able to connect with SSH on both machines with no password
- install K3s on both machines
    => in manki_S => installed in controller mode
    => in manki_SW => in agent mode

=> use `kubectl`