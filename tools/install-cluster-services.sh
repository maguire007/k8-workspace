

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

eksctl utils associate-iam-oidc-provider --cluster simple-cluster-managed --approve

aws iam create-policy \
    --policy-name AWSLoadBalancerControllerIAMPolicy \
    --policy-document https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/install/iam_policy.json
    
eksctl create iamserviceaccount \
  --cluster simple-cluster-managed \
  --namespace kube-system \
  --name aws-load-balancer-controller \
  --attach-policy-arn arn:aws:iam::985579394705:policy/AWSLoadBalancerControllerIAMPolicy \
  --override-existing-serviceaccounts \
  --approve
  
  
kubectl apply -k github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master

kubectl get crd

helm repo add eks https://aws.github.io/eks-charts


helm upgrade -i aws-load-balancer-controller \
    eks/aws-load-balancer-controller \
    -n kube-system \
    --set clusterName=simple-cluster-managed \
    --set serviceAccount.create=false \
    --set serviceAccount.name=aws-load-balancer-controller \
    --set image.tag="${LBC_VERSION}"

kubectl -n kube-system rollout status deployment aws-load-balancer-controller

curl -s https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/main/docs/examples/2048/2048_full.yaml \
    | sed 's=alb.ingress.kubernetes.io/target-type: ip=alb.ingress.kubernetes.io/target-type: instance=g' \
    | kubectl apply -f -