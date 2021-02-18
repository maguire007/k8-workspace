# Install HomeBrew
#   BEGIN Fix touch while this is not closed
[ ! -f /usr/bin/touch ] && sudo ln /bin/touch /usr/bin/touch
#   END Fix touch while this is not closed

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# Update SAM CLI
brew tap aws/tap
brew install aws-sam-cli
sam --version

# Update CDK
npm install -g aws-cdk --force

# Install git-remote-codecommit helper
pip install --user git-remote-codecommit

echo 'eval $(/home/ec2-user/.linuxbrew/bin/brew shellenv)' >> /home/ec2-user/.bash_profile
eval $(/home/ec2-user/.linuxbrew/bin/brew shellenv)



