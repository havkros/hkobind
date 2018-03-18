# hkobind
Minimal Bind9 Dockerized. Based on Alpine Linux.

Note that 172.17.0.2 is the IP address of my own bind9 container. It might be different from your container, so please update the instructions below with your own container IP address.

## Instructions

1. Pull git project using git clone

2. Build the docker image: 

	docker build -t hkobind .
	
3. Run the Docker container: 

	docker run -it -p 53:53 hkobind

4. Test that the bind9 DNS server is working by opening a terminal on your Docker host and execute the following commands: 

	nslookup core.testlab.local 172.17.0.2

	host 192.168.200.4

## Virtual machine environment

If your Docker host is a VM and you wish to perform DNS queries from the virtualization host (e.g. a Mac or Windows 10) into the VM, and forward it to the Bind9 Docker container, you must add these iptables rules inside the Docker host VM:

	sysctl net.ipv4.conf.all.forwarding=1

	iptables -A PREROUTING -t nat -i ens36 -p udp --dport 53 -j DNAT --to-destination 172.17.0.2:53

	iptables -A FORWARD -p udp -d 172.17.0.2 --dport 53 -j ACCEPT

	iptables -A POSTROUTING -t nat -s 172.17.0.2 -o ens36 -j MASQUERADE

NOTE: ens36 is the VM NIC connected to the VMware host-only network that is shared with the virtualization host.