SECONDS=0
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt upgrade -y
sudo apt install -y docker-ce
sudo systemctl enable docker
sudo snap install kubectl --classic
sudo wget http://archive.ubuntu.com/ubuntu/pool/main/m/mesa/libgl1-mesa-dri_19.0.8-0ubuntu0~18.04.3_amd64.deb
sudo dpkg -i libgl1-mesa-dri_19.0.8-0ubuntu0~18.04.3_amd64.deb
sudo apt-get -fy install
sudo apt install -y virtualbox
sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.5.2.deb && sudo dpkg -i minikube_1.5.2.deb
sudo rm -f minikube_1.5.2.deb
sudo minikube start --vm-driver=none
sudo apt install -y socat
sudo snap install helm --classic
sudo helm init
sudo curl -L "https://github.com/jenkins-x/jx/releases/download/$(curl --silent "https://github.com/jenkins-x/jx/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#')/jx-linux-amd64.tar.gz" | tar xzv "jx"
sudo mv jx /usr/local/bin
sudo sed -i'.bak' '/^    - --tls-private-key-file=\/var\/lib\/minikube\/certs\/apiserver.key.*/a\    \- --runtime-config=apps\/v1beta1=true,extensions\/v1beta1\/deployments=true' /etc/kubernetes/manifests/kube-apiserver.yaml
sudo jx install cluster minikube --no-default-environments
echo "elapsed time $SECONDS seconds"
