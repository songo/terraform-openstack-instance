# vars
variable "count" {
  default = 1
}
variable "image-id" {}
variable "keypair" {}
variable "ext-network" {}
variable "loc-network" {}
variable "volume-size" {
  default = 20
}
variable "security-groups" {
  default = ["default"]
}
variable "flavor-name" {
  default = "m1.small"
}
variable "volume-type" {
  default = "ceph"
}
variable "instance-name" {}
