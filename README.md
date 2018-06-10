# Terraform module for OpenStack/FlexibleEngine instance

Simple [Terraform](https://github.com/hashicorp/terraform) module which creates
a typical
[OpenStack](https://github.com/terraform-providers/terraform-provider-openstack)
server/instance (volume based). A couple of parameters can be passed to do a
little customization. The
[FlexibleEngine](https://github.com/terraform-providers/terraform-provider-flexibleengine)
platform is also supported.

## Quick start (OpenStack)

### Prerequisites

Make sure all OpenStack parameters are set in environment, like:
```sh
$ cat default-operrc.sh
export OS_DOMAIN_NAME=<domain>
export OS_USER_DOMAIN_NAME=<user-domain>
export OS_PROJECT_DOMAIN_NAME=<project-domain>
export OS_PROJECT_NAME=<myproject>
export OS_USERNAME=<myuser>
export OS_PASSWORD=XXXXXXXX
export OS_AUTH_URL=https://os-endpoint:5000/
export OS_IDENTITY_API_VERSION=3

$ source ./default-operrc.sh
```

### Terraform code to create just one instance

```hcl
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
```

## Parameters
See [OpenStack parameters](./instance-os/README.md) or [FlexibleEngine
parameters](./instance-fe/README.md).

## FlexibleEngine
When you are using FlexibleEngine instead of pure OpenStack use
[`instance-fe`](./instance-fe/) and add [FlexibleEngine
Provider](https://github.com/terraform-providers/terraform-provider-flexibleengine)
declaration along with the OpenStack one, like this:

```hcl
# Configure providers
provider "flexibleengine" {
}

provider "openstack" {
}
```

## Author

This module is created and managed by [Krzysztof Gajdemski](https://github.com/songo).

## License

Apache 2.0. See the [LICENSE](LICENSE) file for details.
