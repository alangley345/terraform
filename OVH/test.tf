resource "proxmox_lxc" "basic" {
  target_node  = "proxmox"
  hostname     = "lxc-basic"
  ostemplate   = "local:centos-8-default_20201210_amd64.tar.xy"
  password     = "BasicLXCContainer"
  unprivileged = true
  ssh_public_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAzJDvn1+/zbGXqxMcPNV0HXpBEZrwB7k6/dPLP53PG3XVMX+YWAUfgPt7lm/o3PMADxbXePQaP9mn1NWc1vfwa2kQOcmL1cztlyvQu5xeXSE/fn0/ZPYwD3KDHQB3A5aZnycDuLcHbwdEpCxbBXdaar78U2jPdExaeQdw0RnQep0lFR1b94SB4xAoWN0ykSKb3aWWFMfp7O2qKHwgkJuKLeTEr4neYz1WsxZyq/sEvZojEd2YBcE80sLmercjvhCgiOWguH5aQhfQ+aWjInO+JzfYKXAZaRYeQAaH3JJH9zfPaXnGh0W10wyW68A4j6PxsICM0Pw4oy03uU+Vi++wHw74HM7wO9T0Vd0+9+ALwzAQ53TFYFW7Tf6FybKctBhyKM3mQvs0K8bXuI9l34YSnPXEo/K/klYE3T/ZdBBtXZFI4M9qmkUwakWWF2/6v5jYydgvbqyHUowB8v81IJ3VrKiMZo4yg2Au6TcuTXmbyejGFYZ26kSXHamYoGGMQds= aaron@greatcatlab.net"
  nameserver = "10.1.0.1"

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "Storage"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr2"
    ip     = "10.1.0.200/24"
    gw = "10.1.0.1"
    tag = "1010"
  }
}