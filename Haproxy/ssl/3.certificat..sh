#!/bin/sh
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt