# Configure the OpenStack Provider
# (let's assume all connection parameters are set in environment).
provider "openstack" {
}

# Create on instance with floating IP
module "instance" {
  source = "github.com/songo/terraform-openstack-instance/instance-os"

  # Name of the instance (it will be suffixed by numer even if only
  # one created)
  instance-name = "newserver"

  # Id of glance image (will be used as source for volume)
  image-id = "f5b22258-cdbe-41fd-ba33-71a7cde47721"

  # Keypair for deployment
  keypair = "deploy-keys"

  # Server flavor name (optional, m1.small is default).
  flavor-name = "m1.medium"

  # Neutron external network name
  external-network-name = "float1"

  # Number of floating IPs.
  # NOTE: it can be set to false to not create floating IP. If not
  #       false it must be equal to number of instances created.
  #       That is, if you use count here, count-fip must be equal to count
  #       or false.
  count-fip = 1

  # Id of primary instance network
  local-network-id = "1053db48-9207-4c52-8dfd-86d1e272cb65"

  # List of instance security groups
  security-groups = ["default"]
}
