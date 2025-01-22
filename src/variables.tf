###cloud vars
variable "token" {
  type        = string
}

variable "cloud_id" {
  type        = string
}

variable "folder_id" {
  type        = string
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
}

###common vars

variable "each_vm" {
  type = map(object({
      name = string
      owner = string
      subnet_zones = list(string)
      count = number
      cpu = number
      ram = number
      disk_volume = number
      core_fraction = number 
      image = string
      scheduling_policy = bool
      platform_id = string
      nat = bool
    }))
    default = {
      "marketing" = {
        name = "marketing"
        owner = "i.ivanov"
        subnet_zones = ["ru-central1-a","ru-central1-b"]
        count = 2
        cpu = 2
        ram = 2
        disk_volume = 10
        core_fraction = 5 
        image = "ubuntu-2004-lts"
        scheduling_policy = "true"
        platform_id = "standard-v1"
        nat = true
      },
      "analytics" = {
        name = "analytics"
        owner = "i.ivanov"
        subnet_zones = ["ru-central1-a"]
        count = 1
        cpu = 2
        ram = 2
        disk_volume = 20
        core_fraction = 5 
        image = "ubuntu-2004-lts"
        scheduling_policy = "true"
        platform_id = "standard-v1"
        nat = true
      }
    }
}

/*
variable "each_subnet" {
  type = map(object({
    name = string
    zone = string
    cidr = list(string)
  }))
  default = {
    "subnet-a" = {
      name = "develop-ru-central1-a"
      zone = "ru-central1-a"
      cidr = ["10.0.1.0/24"]
    },
    "subnet-b" = {
      name = "develop-ru-central1-b"
      zone = "ru-central1-b"
      cidr = ["10.0.2.0/24"]
    }
  }
}
*/

variable "tag" {
  type = string
  default = "0.0.1"
}