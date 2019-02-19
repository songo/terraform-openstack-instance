# Terraform module to create OpenStack instance

See [examples](../examples/) for basic usage.

## Variables

* `count` - Number of servers created (default = `1`)
* `count-fip` - Number of floating IPs. Must be equal to `count` or `false` to not create any floating IP.
* `image-id` -  Glance image ID to boot server from.
* `keypair` - SSH keypair for server management.
* `external-network-name` - Name of neutron external network.
* `local-network-id` - Id of internal (primary server) network.
* `volume-size` - Size of server volume created, in GB (default =`20`).
* `security-groups` - Names of security groups to add to the server. It is a list (default = `["default"]`).
* `flavor-name` - OpenStack flavor name for created server (default = `"m1.small"`).
* `volume-type` - Glance volume type. Default is set but almost certainly it must be changed (default = `"ceph"`).
* `instance-name` - Server name. If will be suffixed by `-<count_number>`.
* `instance-domain` - Instance domain (default empty, use in form `".domain"`).
* `user-data` - The user-data configuration passed to instance for additional configuration (default = `"#cloud-config\n"` aka do nothing).
* `instance-az` - Server availability zone (default empty, so platform deault will be used).
* `volume-az` - Volume availability zone (default empty, so platform deault will be used).
