# make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas/gateway
sudo make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas/auth/basic-auth
sudo make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas-netes
sudo make
sudo docker pull sdcbench/tfseving-infless:latest
sudo docker tag sdcbench/tfseving-infless:latest tensorflow/serving:latest-gpu

# import local image
cd ~
sudo docker image save -o gateway.tar openfaas/gateway:latest-dev
sudo docker image save -o basicauth.tar openfaas/basic-auth-plugin:0.17.0
sudo docker image save -o faasnetes.tar openfaas/faas-netes:latest-dev
sudo docker image save -o tf.tar tensorflow/serving:latest-gpu
sudo ctr -n=k8s.io image import gateway.tar
sudo ctr -n=k8s.io image import basicauth.tar
sudo ctr -n=k8s.io image import faasnetes.tar
sudo ctr -n=k8s.io image import tf.tar

cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas-netes
sudo ./yaml/apply.sh

# cli make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas-cli
sudo make
sudo mv faas-cli /usr/local/bin/faasdev-cli

sudo apt-get install -y maven
sudo apt-get install openjdk-8-jdk
sudo apt-get install openjdk-8-jre
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

# TODO: yml gateway config, loadGen IP config
