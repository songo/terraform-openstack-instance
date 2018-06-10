# vars
variable "count" {
  default = 1
  description = "Number of instances created"
}

variable "image-id" {}
variable "keypair" {}
variable "local-network-id" {
  description = "Id of internal (main server) network."
}
variable "volume-size" {
  default = 20
}
variable "security-groups" {
  default = ["default"]
}
variable "flavor-name" {
  default = "m1.small"
}
variable "volume-type" {}
variable "instance-name" {}
variable "user-data" {
  description = "Send user-data to instance for additional configuration."
}