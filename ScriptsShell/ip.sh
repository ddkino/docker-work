docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container>


We can also use dig to interact with the DNS interface:

$ dig @0.0.0.0 -p 8600 node1.node.consul
