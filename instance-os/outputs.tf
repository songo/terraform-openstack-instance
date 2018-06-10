# outputs
output "fip" {
  description = "List of floating IP addresses."
  value = "${openstack_networking_floatingip_v2.fip_1.*.address}"
}

output "instance" {
  description = "Server ID."
  value = "${module.instance-common.instance}"
}

output "access_ip_v4" {
  description = "First server private ipv4 address."
  value = "${module.instance-common.access_ip_v4}"
}
