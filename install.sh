#!/bin/bash
docker network create mynet
docker run -tid -p 8001:80 --net mynet --name s1 nginx
docker run -tid -p 8002:80 --net mynet --name s2 nginx
docker run -tid -p 8003:80 --net mynet --name s3 nginx
docker run -tid -p 8004:80 -v=$(pwd)/nginx.conf:/etc/nginx/nginx.conf -v=$(pwd)/upstream.conf:/etc/nginx/upstream.conf --net mynet --name lb nginx&&docker ps -a 

docker exec s1 /bin/bash -c "echo s1 > /usr/share/nginx/html/index.html"
docker exec s2 /bin/bash -c "echo s2 > /usr/share/nginx/html/index.html"
docker exec s3 /bin/bash -c "echo s3 > /usr/share/nginx/html/index.html"
