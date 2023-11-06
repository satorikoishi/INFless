# make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas/gateway
sudo make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas/auth/basic-auth
sudo make
cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas-netes
sudo make

# import local image
cd ~
sudo docker image save -o gateway.tar openfaas/gateway:latest-dev
sudo docker image save -o basicauth.tar openfaas/basic-auth-plugin:0.17.0
sudo docker image save -o faasnetes.tar openfaas/faas-netes:latest-dev
sudo ctr -n=k8s.io image import gateway.tar
sudo ctr -n=k8s.io image import basicauth.tar
sudo ctr -n=k8s.io image import faas-netes.tar

cd ~/INFless/sourceCode/Go/src/github.com/openfaas/faas-netes
sudo ./yaml/apply.sh