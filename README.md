# hkobind
Bind9 Dockerized

Build: docker build -t hkobind .
Run: docker run -it -p 53:53 hkobind

Test: 

	nslookup core.testlab.local 172.17.0.2

	host 192.168.200.4
