#!/bin/bash

# Ubuntu
docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD export REPO_UBUNTU_1404="ansible_ubuntu_1404"
export ANSIBLE_VERSION_UBUNTU_1404=$(docker run $DOCKER_USERNAME/$REPO_UBUNTU_1404 /bin/bash -c "ansible --version"|head -1 |awk '{print $2}')
echo "ANSIBLE_VERSION_UBUNTU_1404=${ANSIBLE_VERSION_UBUNTU_1404}"
export NEW_REPO_UBUNTU_1404="${REPO_UBUNTU_1404}:ansible_${ANSIBLE_VERSION_UBUNTU_1404}"
echo "NEW_REPO_UBUNTU_1404=${NEW_REPO_UBUNTU_1404}"
docker build -t $DOCKER_USERNAME/$NEW_REPO_UBUNTU_1404 -f ubuntu/trusty_1404/Dockerfile .
export REPO_UBUNTU_1604="ansible_ubuntu_1604"
export ANSIBLE_VERSION_UBUNTU_1604=$(docker run $DOCKER_USERNAME/$REPO_UBUNTU_1604 /bin/bash -c "ansible --version"|head -1 |awk '{print $2}')
echo "ANSIBLE_VERSION_UBUNTU_1604=${ANSIBLE_VERSION_UBUNTU_1604}"
export NEW_REPO_UBUNTU_1604="${REPO_UBUNTU_1604}:ansible_${ANSIBLE_VERSION_UBUNTU_1604}"
echo "NEW_REPO_UBUNTU_1604=${NEW_REPO_UBUNTU_1604}"
docker build -t $DOCKER_USERNAME/$NEW_REPO_UBUNTU_1604 -f ubuntu/xenial_1604/Dockerfile .
export REPO_UBUNTU_1704="ansible_ubuntu_1704"
export ANSIBLE_VERSION_UBUNTU_1704=$(docker run $DOCKER_USERNAME/$REPO_UBUNTU_1704 /bin/bash -c "ansible --version"|head -1 |awk '{print $2}')
echo "ANSIBLE_VERSION_UBUNTU_1704=${ANSIBLE_VERSION_UBUNTU_1704}"
export NEW_REPO_UBUNTU_1704="${REPO_UBUNTU_1704}:ansible_${ANSIBLE_VERSION_UBUNTU_1704}"
echo "NEW_REPO_UBUNTU_1704=${NEW_REPO_UBUNTU_1704}"
docker build -t $DOCKER_USERNAME/$NEW_REPO_UBUNTU_1704 -f ubuntu/zesty_1704/Dockerfile .

#Centos
export REPO_CENTOS_7="ansible_centos_7"
export ANSIBLE_VERSION_CENTOS_7=$(docker run $DOCKER_USERNAME/$REPO_CENTOS_7 /bin/bash -c "ansible --version"|head -1 |awk '{print $2}')
echo "ANSIBLE_VERSION_CENTOS_7=${ANSIBLE_VERSION_CENTOS_7}"
export NEW_REPO_CENTOS_7="${REPO_CENTOS_7}:ansible_${ANSIBLE_VERSION_CENTOS_7}"
echo "NEW_REPO_CENTOS_7=${NEW_REPO_CENTOS_7}"
docker build -t $DOCKER_USERNAME/$NEW_REPO_CENTOS_7 -f centos/centos_7/Dockerfile .
docker images
docker ps -a
