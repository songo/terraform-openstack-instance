# vars
variable "count" {
  default = 1
  description = "Number of servers created."
}

variable "count-fip" {
  description =
    "Number of floating IPs. Must be equal to ${var.count} or false to not create it."
}

variable "image-id" {
  description = "Glance image ID to boot server from."
}

variable "keypair" {
  description = "SSH keypair for server management."
}

variable "external-network-name" {
  description = "Name of neutron external network."
}

variable "local-network-id" {
  description = "Id of internal (primary server) network."
}

variable "volume-size" {
  description = "Size of server volume created (in GB)."
  default = 20
}

variable "security-groups" {
  description = "Names of security groups to add to the server (list)."
  default = ["default"]
}

variable "flavor-name" {
  description = "OpenStack flavor name for created server."
  default = "m1.small"
}

variable "volume-type" {
  description = "Glance volume type. Default is set but almost certainly it must be changed."
  default = "ceph"
}

variable "instance-name" {
  description = "Server name. If will be suffixed by -<number>."
}

variable "instance-domain" {
  description = "Server domain. Use in form: '.domain'."
  default = ""
}

variable "user-data" {
  description = "The user-data configuration passed to instance for additional configuration."
  default = "#cloud-config\n"
}

variable "instance-az" {
  description = "Instance availability zone."
  default = ""
}

variable "volume-az" {
  description = "Volume availability zone."
  default = ""
}
