# outputs
output "instance" {
  value = "${openstack_compute_instance_v2.instance.*.id}"
}

output "access_ip_v4" {
  value = "${openstack_compute_instance_v2.instance.*.access_ip_v4}"
}
