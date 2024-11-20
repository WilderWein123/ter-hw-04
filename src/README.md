<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.8.4 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_analytics-vm"></a> [analytics-vm](#module\_analytics-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_marketing-vm"></a> [marketing-vm](#module\_marketing-vm) | git::https://github.com/udjin10/yandex_compute_instance.git | main |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | n/a | `string` | n/a | yes |
| <a name="input_default_cidr"></a> [default\_cidr](#input\_default\_cidr) | https://cloud.yandex.ru/docs/vpc/operations/subnet-create | `list(string)` | <pre>[<br/>  "10.0.1.0/24"<br/>]</pre> | no |
| <a name="input_default_zone"></a> [default\_zone](#input\_default\_zone) | https://cloud.yandex.ru/docs/overview/concepts/geo-scope | `string` | `"ru-central1-a"` | no |
| <a name="input_each_subnet"></a> [each\_subnet](#input\_each\_subnet) | n/a | <pre>map(object({<br/>    name = string<br/>    zone = string<br/>    cidr = list(string)<br/>  }))</pre> | <pre>{<br/>  "subnet-a": {<br/>    "cidr": [<br/>      "10.0.1.0/24"<br/>    ],<br/>    "name": "develop-ru-central1-a",<br/>    "zone": "ru-central1-a"<br/>  },<br/>  "subnet-b": {<br/>    "cidr": [<br/>      "10.0.2.0/24"<br/>    ],<br/>    "name": "develop-ru-central1-b",<br/>    "zone": "ru-central1-b"<br/>  }<br/>}</pre> | no |
| <a name="input_each_vm"></a> [each\_vm](#input\_each\_vm) | n/a | <pre>map(object({<br/>      name = string<br/>      owner = string<br/>      subnet_zones = list(string)<br/>      count = number<br/>      cpu = number<br/>      ram = number<br/>      disk_volume = number<br/>      core_fraction = number <br/>      image = string<br/>      scheduling_policy = bool<br/>      platform_id = string<br/>      nat = bool<br/>    }))</pre> | <pre>{<br/>  "analytics": {<br/>    "core_fraction": 5,<br/>    "count": 1,<br/>    "cpu": 2,<br/>    "disk_volume": 20,<br/>    "image": "ubuntu-2004-lts",<br/>    "name": "analytics",<br/>    "nat": true,<br/>    "owner": "i.ivanov",<br/>    "platform_id": "standard-v1",<br/>    "ram": 2,<br/>    "scheduling_policy": "true",<br/>    "subnet_zones": [<br/>      "ru-central1-a"<br/>    ]<br/>  },<br/>  "marketing": {<br/>    "core_fraction": 5,<br/>    "count": 2,<br/>    "cpu": 2,<br/>    "disk_volume": 10,<br/>    "image": "ubuntu-2004-lts",<br/>    "name": "marketing",<br/>    "nat": true,<br/>    "owner": "i.ivanov",<br/>    "platform_id": "standard-v1",<br/>    "ram": 2,<br/>    "scheduling_policy": "true",<br/>    "subnet_zones": [<br/>      "ru-central1-a",<br/>      "ru-central1-b"<br/>    ]<br/>  }<br/>}</pre> | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | n/a | `string` | n/a | yes |
| <a name="input_token"></a> [token](#input\_token) | ##cloud vars | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | n/a | `string` | `"develop"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->