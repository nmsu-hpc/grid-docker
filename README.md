# grid-docker
These are Docker build files for HTCondor running as a slave(worker) node. The container is running CentOS7.

To build the image use:
docker build grid-docker -t name

To run image use:
docker images 
docker run -dit -p 9618:9618 -e HOST_IP=$(hostname --ip-address) IMAGE_ID

To get into the container use:
docker exec -it CONTAINER_NAME /bin/bash

To pull the latest image use:
docker pull trecakov/htcondor-slave-node

