resource "proxmox_vm_qemu" "proxmox_vm" {
  count             = 1
  name              = "tf-vm-${count.index}"
  target_node       = "Proxmox"
  iso               = "pfSense-CE-2.5.2-RELEASE-amd.iso"
os_type           = "linux"
  cores             = 4
  sockets           = "1"
  cpu               = "host"
  memory            = "8096"
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "cdrom0"
disk {
    ssd             = 0
    size            = "32G"
    type            = "scsi"
    storage         = "Storage"
    iothread        = 1
    backup          = 1
  }
network {
    tag             = -1
    model           = "virtio"
    bridge          = "vmbr1"
  }
lifecycle {
    ignore_changes  = [
      network,
    ]
  }
}