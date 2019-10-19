
EtcD:
curl -G "telnet://192.168.205.10:2379"

Kubelet:
curl -v "telnet://192.168.205.11:10250"


Secrets Demo:
k create secret generic base64-secret --from-literal username=jagdsh --from-literal password=qwerty

kctx insecure-cluster
kg secrets base64-secret
k describe secret base64-secret
kex -it etcd-k8s-master -n kube-system /bin/sh

ETCDCTL_API=3 etcdctl --endpoints "https://192.168.205.10:2379" --cert /etc/kubernetes/pki/etcd/server.crt --key /etc/kubernetes/pki/etcd/server.key --cacert /etc/kubernetes/pki/etcd/ca.crt get "" --prefix=true -w json >> etcd-kv.json

k cp etcd-k8s-master:/etcd-kv.json . -n kube-system
code etcd-kv.json
for k in $(cat etcd-kv.json | jq '.kvs[].key' | cut -d '"' -f2); do echo $k | base64 --decode; echo; done >> key_value.txt
for k in $(cat etcd-kv.json | jq '.kvs[].value' | cut -d '"' -f2); do echo $k | base64 --decode; echo; done >> key_value.txt


RBAC:
UserGeneration
    openssl genrsa -out user1.key 2048
    openssl req -new -key user1.key -out user1.csr -subj "/CN=user1/O=limituser"
    sudo openssl x509 -req -in user1.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out user1.crt -days 500

    kubectl create -f role-deployment-manager.yaml
    k auth can-i delete node


    NOTES
    https://www.shodan.io/search?query=etcd