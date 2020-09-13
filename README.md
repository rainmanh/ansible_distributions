[![Build Status](https://travis-ci.org/rainmanh/ansible_distributions.svg)](https://travis-ci.org/rainmanh/ansible_distributions)


# ansible_distributions

This is an automated Docker Image Builder using Travis and offering the latest ansible on Ubuntu and centos:

Ubuntu:
  * 14.04
  * 16.04
  * 17.04
  * 18.04
  * 19.04

Centos:

  * 6
  * 7


What comes in the docker build:

 * ansible (latest base install, not customised)
 * pip (latest base install)

Docker Hub URLs:

  * https://hub.docker.com/r/ranmanh/ansible_ubuntu_1404/
  * https://hub.docker.com/r/ranmanh/ansible_ubuntu_1406/
  * https://hub.docker.com/r/ranmanh/ansible_ubuntu_1704/
  * https://hub.docker.com/r/ranmanh/ansible_ubuntu_1804/
  * https://hub.docker.com/r/ranmanh/ansible_ubuntu_1904/
  * https://hub.docker.com/r/ranmanh/ansible_centos_6/
  * https://hub.docker.com/r/ranmanh/ansible_centos_7/


Default (latest Docker pull):
```
docker pull ranmanh/ansible_ubuntu_1404
docker pull ranmanh/ansible_ubuntu_1604
docker pull ranmanh/ansible_ubuntu_1704
docker pull ranmanh/ansible_ubuntu_1804
docker pull ranmanh/ansible_ubuntu_1904

docker pull ranmanh/ansible_centos_6
docker pull ranmanh/ansible_centos_7

```


## Requirements

 * docker

