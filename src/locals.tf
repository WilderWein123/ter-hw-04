locals {
    ssh_pub_key = file("id_rsa.pub")
    ssh_public_key = local.ssh_pub_key
    cloudinit = templatefile("cloud-init.yml", {
        ssh_public_key = local.ssh_pub_key
    })
}