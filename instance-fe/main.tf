# call common instance module
module "instance-common" {
  source = "../instance-common"
  instance-name = "${var.instance-name}"
  count = "${var.count}"
  image-id = "${var.image-id}"
  keypair = "${var.keypair}"
  local-network-id = "${var.local-network-id}"
  flavor-name = "${var.flavor-name}"
  volume-type = "${var.volume-type}"
  volume-size = "${var.volume-size}"
  security-groups = "${var.security-groups}"
  user-data = "${var.user-data}"
}

resource "flexibleengine_networking_floatingip_v2" "fip_1" {
  pool = "${var.external-network-name}"
  count = "${var.count-fip}"
}

resource "flexibleengine_compute_floatingip_associate_v2" "fip_1" {
  floating_ip = "${flexibleengine_networking_floatingip_v2.fip_1.*.address[count.index]}"
  instance_id = "${module.instance-common.instance[count.index]}"
  count = "${var.count-fip}"
}
