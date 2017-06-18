#!/bin/bash

ubuntu_versions="1404 1604 1704"
centos_versions="6 7"

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD

# Ubuntu
for ubuntu_version in $ubuntu_versions; do

  eval export REPO_UBUNTU_${!ubuntu_version}=ansible_ubuntu_${ubuntu_version}
  eval export ANSIBLE_VERSION_UBUNTU_${!ubuntu_version}=$(docker run $DOCKER_USERNAME/$REPO_UBUNTU_${!ubuntu_version} /bin/bash -c 'ansible --version'|head -1 |awk '{print $2}')
  echo "ANSIBLE_VERSION_UBUNTU_${ubuntu_version}=$ANSIBLE_VERSION_UBUNTU_${!ubuntu_version}"
  eval export NEW_REPO_UBUNTU_${!ubuntu_version}="$REPO_UBUNTU_${!ubuntu_version}:ansible_$ANSIBLE_VERSION_UBUNTU_${!ubuntu_version}"
  echo "NEW_REPO_UBUNTU_${ubuntu_version}=$NEW_REPO_UBUNTU_${!ubuntu_version}"
  docker build -t $DOCKER_USERNAME/$NEW_REPO_UBUNTU_${!ubuntu_version} -f ubuntu/${ubuntu_version}/Dockerfile .
  docker push $DOCKER_USERNAME/$NEW_REPO_UBUNTU_${!ubuntu_version}

done

#Centos
for centos_version in $centos_versions; do

  eval export REPO_CENTOS_${!centos_version}=ansible_centos_${!centos_version}
  eval export ANSIBLE_VERSION_CENTOS_${!centos_version}=$(docker run $DOCKER_USERNAME/$REPO_CENTOS_${!centos_version} /bin/bash -c 'ansible --version'|head -1 |awk '{print $2}')
  echo "ANSIBLE_VERSION_CENTOS_${centos_version}=$ANSIBLE_VERSION_CENTOS_${!centos_version}"
  eval export NEW_REPO_CENTOS_${!centos_version}="$REPO_CENTOS_${!centos_version}:ansible_$ANSIBLE_VERSION_CENTOS_${!centos_version}"
  echo "NEW_REPO_CENTOS_${centos_version}=$NEW_REPO_CENTOS_${!centos_version}"
  docker build -t $DOCKER_USERNAME/$NEW_REPO_CENTOS_${!centos_version} -f centos/${centos_version}/Dockerfile .
  docker push $DOCKER_USERNAME/$NEW_REPO_CENTOS_${!centos_version}
  docker images
  docker ps -a
