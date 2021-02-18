
CLUSTERNAME="simple-cluster-managed"
REGION="us-east-1"

sudo yum install -y nano jq

# Create directory
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin

# kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.18.13/bin/linux/amd64/kubectl
chmod +x kubectl

# Create $HOME/.kube/config
aws eks update-kubeconfig --name $CLUSTERNAME

# eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl $HOME/.local/bin

# helm
export VERIFY_CHECKSUM=false
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
sudo mv /usr/local/bin/helm $HOME/.local/bin


# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# Install at startup
sudo yum install -y bash-completion > /dev/null 2>&1

kubectl completion bash > $HOME/.bash_completion



aws eks --region $REGION update-kubeconfig --name $CLUSTERNAME

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