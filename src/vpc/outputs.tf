output "vpc_network_id" {
    value = yandex_vpc_network.develop.id
}

output "vpc_network_subnets_id" {
    value = yandex_vpc_subnet.develop.id
    depends_on = [ yandex_vpc_network.develop ]
}