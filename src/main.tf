#создаем облачную сеть
resource "yandex_vpc_network" "develop" {
  name = "develop"
}

#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = var.each_subnet.subnet-a.name
  zone           = var.each_subnet.subnet-a.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.each_subnet.subnet-a.cidr
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.each_subnet.subnet-b.name
  zone           = var.each_subnet.subnet-b.zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.each_subnet.subnet-b.cidr
}

module "marketing-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.each_vm.marketing.name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.each_vm.marketing.subnet_zones
  subnet_ids     = [yandex_vpc_subnet.develop_a.id,yandex_vpc_subnet.develop_b.id]
  instance_name  = var.each_vm.marketing.name
  instance_count = var.each_vm.marketing.count
  image_family   = var.each_vm.marketing.image
  public_ip      = var.each_vm.marketing.nat

  labels = { 
    owner= var.each_vm.marketing.owner,
    project = var.each_vm.marketing.name
     }

  metadata = {
    user-data          = local.cloudinit
  }
}

module "analytics-vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.each_vm.analytics.name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.each_vm.analytics.subnet_zones
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.each_vm.analytics.name
  instance_count = var.each_vm.analytics.count
  image_family   = var.each_vm.analytics.image
  public_ip      = var.each_vm.analytics.nat

  labels = { 
    owner= var.each_vm.analytics.owner,
    project = var.each_vm.analytics.name
     }

  metadata = {
    user-data          = local.cloudinit
  }
}
