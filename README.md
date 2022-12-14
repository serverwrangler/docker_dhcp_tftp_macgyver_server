# DHCP and TFTP server based on Debian Buster Lite OS running in a Docker container

This project helps to setup a DHCP and TFTP server in one Docker container instance.
This toolset can be used to image Cisco Switches or Aruba APs<br/>
It eases the network configuration process and does not affect the Host environment.

This README does not explains how to write the DHCP and TFTP configurations. Please refer to specific document in the "Usefull links" section if needed.

## Install
First install Docker:
```
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
sudo usermod -aG docker $USER
```
Log out and log in.

## Usage
### Configuration
You can configure your setup by editing:
- the env.conf file (port mappping configuration, TFTP directories)
- the DHCP configuration files in "./etc/dhcp/dhcpd.conf"
- the network interface in "./etc/network/interfaces"

By default the tftp in "./tftp" and the DHCP config are empty. <br/>
Please complete the config file according to your use case.

### Build
Once you have edited the configuration files execute the following command to build the Docker image:
```
./setup.sh
```

### Run
Then launch the Docker container:
```
./run.sh
```

## Usefull links
Alpine OS network Wiki: <br/>
https://wiki.alpinelinux.org/wiki/Configure_Networking <br/>
Editing dhcpd.conf: <br/>
https://www.isc.org/wp-content/uploads/2017/08/dhcp41conf.html <br/>
Editing interfaces: <br/>
https://wiki.debian.org/NetworkConfiguration <br/>
