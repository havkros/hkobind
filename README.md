# hkobind
Minimal Bind9 Dockerized. Based on Alpine Linux.. Only 10.2MB...


Build: 

	docker build -t hkobind .
	
Run: 

	docker run -it -p 53:53 hkobind

Test: 

	nslookup core.testlab.local 172.17.0.2

	host 192.168.200.4

## Virtual machine environment

If your Docker host is a VM and you wish to perform DNS queries from the virtualization host (e.g. a Mac or Windows 10) into the VM and the Bind9 Docker container you must add these iptables rules inside the Docker host VM:

	iptables -A PREROUTING -t nat -i ens36 -p udp --dport 53 -j DNAT --to-destination 172.17.0.2:53

	iptables -A FORWARD -p udp -d 172.17.0.2 --dport 53 -j ACCEPT

	iptables -A POSTROUTING -t nat -s 172.17.0.2 -o ens36 -j MASQUERADE

NOTE: ens36 is the VM NIC connected to the VMware host-only network that is shared with the virtualization host.
 

