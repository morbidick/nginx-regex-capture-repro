#!/bin/bash
docker run --rm --name ngx -p 8080:80 -v $PWD/nginx.conf:/etc/nginx/nginx.conf:ro nginx:1.15
