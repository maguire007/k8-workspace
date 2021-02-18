
CLUSTERNAME=simple-cluster-managed

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

