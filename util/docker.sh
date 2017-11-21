#! /bin/bash
function docker_install() {
  is_installed=`docker -v`
  if [ $? -eq 0 ]; then
    echo 'Install error, system already has docker with version:'${is_installed}
    return
  fi

  apt-get remove docker docker-engine docker.io
  apt-get update

  apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  apt-get update

  # 默认输入yes
  apt-get install -y docker-ce

  docker run hello-world | grep 'Hello from Docker!' | xargs echo

  echo 'Congratulations! Docker has been install successfully.'

  groupadd docker
  usermod -aG docker $USER

  # 换成国内源 Daocloud
  sed -i '/#DOCKER_OPTS=/a\DOCKER_OPTS="--registry-mirror=http://aad0405c.m.daocloud.io"' /etc/default/docker
  service docker restart
  echo 'pls logout for opreating docker with non-root'
}
docker_install
