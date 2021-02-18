# k8-workspace


export ACCOUNT_ID=$(aws sts get-caller-identity --output text --query Account)
export AWS_REGION=$(curl -s 169.254.169.254/latest/dynamic/instance-identity/document | jq -r '.region')
export AZS=($(aws ec2 describe-availability-zones --query 'AvailabilityZones[].ZoneName' --output text --region us-east-1))
aws ec2 create-key-pair --region us-east-1 --key-name eks-keypair

eksctl create cluster \
--name simple-cluster-managed \
--region us-east-1 \
--with-oidc \
--ssh-access \
--ssh-public-key eks-keypair \
--managed


eksctl create nodegroup \
  --cluster simple-cluster-managed \
  --region us-east-1 \
  --name ng-1 \
  --node-type m5.large \
  --nodes 3 \
  --nodes-min 3 \
  --nodes-max 5 \
  --ssh-access \
  --ssh-public-key eks-keypair \
  --managed
  
  eksctl create iamserviceaccount --name alb-ingress-controller --namespace kube-system \
  --cluster simple-cluster-managed --attach-policy-arn IAM-policy-arn-created-in-step-3 \
  --approve --override-existing-serviceaccounts
  
  eksctl get iamserviceaccount --cluster your-cluster-name --name your-service-account-name --namespace your-namespace