# Server volume
resource "openstack_blockstorage_volume_v2" "instance-vol1" {
  count	      = "${var.count}"
  name        = "${var.instance-name}-${count.index}"
  description = "server boot volume"
  size        = "${var.volume-size}"
  image_id    = "${var.image-id}"
  volume_type = "ceph"
}

# Create an instance
resource "openstack_compute_instance_v2" "instance" {
  count		  = "${var.count}"
  name            = "${var.instance-name}-${count.index}"
  flavor_name     = "${var.flavor-name}"
  key_pair        = "${var.keypair}"
  security_groups = "${var.security-groups}"

  block_device {
    uuid		  = "${element(openstack_blockstorage_volume_v2.instance-vol1.*.id, count.index)}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }
  
  network {
    name = "${var.loc-network}"
  }
}

resource "openstack_networking_floatingip_v2" "fip_1" {
  pool = "${var.ext-network}"
  count = "${var.count}"
}

resource "openstack_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${element(openstack_networking_floatingip_v2.fip_1.*.address, count.index)}"
  instance_id = "${element(openstack_compute_instance_v2.instance.*.id, count.index)}"
  count = "${var.count}"
}
