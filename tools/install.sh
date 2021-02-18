
# install kubectl 

curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl


chmod +x ./kubectl


mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin


echo 'export PATH=$PATH:$HOME/bin' >> ~/.bash_profile

kubectl version --short --client



# install eksctl

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

mv /tmp/eksctl /usr/local/bin

eksctl version


# helm


curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh


helm help


# brew install k8 tools

sudo yum -y install jq gettext bash-completion moreutils

echo 'yq() {
  docker run --rm -i -v "${PWD}":/workdir mikefarah/yq "$@"
}' | tee -a ~/.bash_profile && source ~/.bash_profile


brew install kubectx
brew install krew
brew install stern



# bash stuff

kubectl completion bash >>  ~/.bash_completion
. /etc/profile.d/bash_completion.sh
. ~/.bash_completion


# alb version

echo 'export LBC_VERSION="v2.0.0"' >>  ~/.bash_profile
.  ~/.bash_profile

# kubectl alias

# Install useful alias for kubectl
 export "alias k='kubectl'"  >>~/.bash_profile
 export "alias kget='kubectl get '"  >>~/.bash_profile
 export "alias kns='kubens'"  >>~/.bash_profile
 export "alias kscale0='kubectl scale deployment --replicas=0 '"  >>~/.bash_profile
 export "alias kscale1='kubectl scale deployment --replicas=1 '"  >>~/.bash_profile
 export "alias kscale10='kubectl scale deployment --replicas=10 '"  >>~/.bash_profile
 export "alias kscale2='kubectl scale deployment --replicas=2 '"  >>~/.bash_profile
 export "alias kscale3='kubectl scale deployment --replicas=3 '"  >>~/..rofile
 export "alias kscale4='kubectl scale deployment --replicas=4 '"  >>~/.bash_profile
 export "alias kscale5='kubectl scale deployment --replicas=5 '"  >>~/.bash_profile
 export "alias kscale6='kubectl scale deployment --replicas=6 '"  >>~/.bash_profile
 export "alias kscale7='kubectl scale deployment --replicas=7 '"  >>~/.bash_profile
 export "alias kscale8='kubectl scale deployment --replicas=8 '"  >>~/.bash_profile
 export "alias kscale9='kubectl scale deployment --replicas=9 '"  >>~/.bash_profile
 export "alias kstart='kubectl scale deployment --replicas=1 '"  >>~/.bash_profile
 export "alias kstop='kubectl scale deployment --replicas=0 '"  >>~/.bash_profile
 export "alias ktail='kubectl logs --timestamps -f --tail=250 '"  >>~/.bash_profile
 export "alias ktx='kubectx'"  >>~/.bash_profile
 export "alias kx='kc exec -it '"  >>~/.bash_profile

