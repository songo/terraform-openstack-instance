# Server volume
resource "openstack_blockstorage_volume_v2" "instance-vol1" {
  count	      = "${var.count}"
  name        = "${var.instance-name}-${count.index}${var.instance-domain}"
  description = "server boot volume"
  size        = "${var.volume-size}"
  image_id    = "${var.image-id}"
  volume_type = "${var.volume-type}"
  availability_zone = "${var.volume-az}"
}

# Create an instance
resource "openstack_compute_instance_v2" "instance" {
  count		  = "${var.count}"
  name            = "${var.instance-name}-${count.index}${var.instance-domain}"
  flavor_name     = "${var.flavor-name}"
  key_pair        = "${var.keypair}"
  security_groups = "${var.security-groups}"
  user_data	  = "${var.user-data}"
  availability_zone = "${var.instance-az}"

  block_device {
    uuid		  = "${openstack_blockstorage_volume_v2.instance-vol1.*.id[count.index]}"
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  network {
    uuid  = "${var.local-network-id}"
  }
}
