minikube start
minikube status
minikube config view
minikube ssh
ls -l /tmp

kubectl get pods -A
NAMESPACE     NAME                               READY   STATUS    RESTARTS       AGE
kube-system   coredns-6f6b679f8f-lmh9t           1/1     Running   1 (106m ago)   5d20h
kube-system   etcd-minikube                      1/1     Running   1 (106m ago)   5d20h
kube-system   kube-apiserver-minikube            1/1     Running   1 (106m ago)   5d20h
kube-system   kube-controller-manager-minikube   1/1     Running   1 (106m ago)   5d20h
kube-system   kube-proxy-98q56                   1/1     Running   1 (106m ago)   5d20h
kube-system   kube-scheduler-minikube            1/1     Running   1 (106m ago)   5d20h
kube-system   storage-provisioner                1/1     Running   3 (105m ago)   5d20h
mypega        my-release-kafka-controller-0      1/1     Running   0              93m
mypega        my-release-kafka-controller-1      1/1     Running   0              93m
mypega        my-release-kafka-controller-2      1/1     Running   0              93m

kubectl describe pods my-release-kafka-controller-0 -n mypega
Name:             my-release-kafka-controller-0
Namespace:        mypega
Priority:         0
Service Account:  my-release-kafka
Node:             minikube/192.168.49.2
Start Time:       Mon, 16 Sep 2024 11:58:08 -0500
Labels:           app.kubernetes.io/component=controller-eligible
                  app.kubernetes.io/instance=my-release
                  app.kubernetes.io/managed-by=Helm
                  app.kubernetes.io/name=kafka
                  app.kubernetes.io/part-of=kafka
                  app.kubernetes.io/version=3.8.0
                  apps.kubernetes.io/pod-index=0
                  controller-revision-hash=my-release-kafka-controller-6b46d87d78
                  helm.sh/chart=kafka-30.1.1
                  statefulset.kubernetes.io/pod-name=my-release-kafka-controller-0
Annotations:      checksum/configuration: 06c814ced80d63b47b7c074293e90fd86757f2d557d2f0bfc9f26ff91d4c90ed
                  checksum/passwords-secret: f064367a666cdea475a76caa35605fae4fe2500c5ff7053d83471f1377a4e5e7
Status:           Running
SeccompProfile:   RuntimeDefault
IP:               10.244.0.23
IPs:
  IP:           10.244.0.23
Controlled By:  StatefulSet/my-release-kafka-controller
Init Containers:
  kafka-init:
    Container ID:  docker://10a15ea192e0125e8d556c451918e75626db3f9d61d61b6778a9db3bd6df5728
    Image:         docker.io/bitnami/kafka:3.8.0-debian-12-r5
    Image ID:      docker-pullable://bitnami/kafka@sha256:999ba91863ef67e13c5704c3145154d0484671222dab2a603bfdeedc4a9fbad7
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/bash
    Args:
      -ec
      /scripts/kafka-init.sh
      
    State:          Terminated
      Reason:       Completed
      Exit Code:    0
      Started:      Mon, 16 Sep 2024 11:58:56 -0500
      Finished:     Mon, 16 Sep 2024 11:58:57 -0500
    Ready:          True
    Restart Count:  0
    Environment:
      BITNAMI_DEBUG:                false
      MY_POD_NAME:                  my-release-kafka-controller-0 (v1:metadata.name)
      KAFKA_VOLUME_DIR:             /bitnami/kafka
      KAFKA_MIN_ID:                 0
      KAFKA_CLIENT_USERS:           user1
      KAFKA_CLIENT_PASSWORDS:       <set to the key 'client-passwords' in secret 'my-release-kafka-user-passwords'>  Optional: false
      KAFKA_INTER_BROKER_USER:      inter_broker_user
      KAFKA_INTER_BROKER_PASSWORD:  <set to the key 'inter-broker-password' in secret 'my-release-kafka-user-passwords'>  Optional: false
      KAFKA_CONTROLLER_USER:        controller_user
      KAFKA_CONTROLLER_PASSWORD:    <set to the key 'controller-password' in secret 'my-release-kafka-user-passwords'>  Optional: false
    Mounts:
      /bitnami/kafka from data (rw)
      /config from kafka-config (rw)
      /configmaps from kafka-configmaps (rw)
      /scripts from scripts (rw)
      /secret-config from kafka-secret-config (rw)
      /tmp from tmp (rw)
Containers:
  kafka:
    Container ID:   docker://3427fde97b60ad687b6976055310eea2ea777aaa63bbc020f36be572c5d09184
    Image:          docker.io/bitnami/kafka:3.8.0-debian-12-r5
    Image ID:       docker-pullable://bitnami/kafka@sha256:999ba91863ef67e13c5704c3145154d0484671222dab2a603bfdeedc4a9fbad7
    Ports:          9093/TCP, 9092/TCP, 9094/TCP
    Host Ports:     0/TCP, 0/TCP, 0/TCP
    State:          Running
      Started:      Mon, 16 Sep 2024 11:58:58 -0500
    Ready:          True
    Restart Count:  0
    Limits:
      cpu:                750m
      ephemeral-storage:  2Gi
      memory:             768Mi
    Requests:
      cpu:                500m
      ephemeral-storage:  50Mi
      memory:             512Mi
    Liveness:             exec [pgrep -f kafka] delay=10s timeout=5s period=10s #success=1 #failure=3
    Readiness:            tcp-socket :controller delay=5s timeout=5s period=10s #success=1 #failure=6
    Environment:
      BITNAMI_DEBUG:                      false
      KAFKA_HEAP_OPTS:                    -Xmx1024m -Xms1024m
      KAFKA_KRAFT_CLUSTER_ID:             <set to the key 'kraft-cluster-id' in secret 'my-release-kafka-kraft-cluster-id'>  Optional: false
      KAFKA_KRAFT_BOOTSTRAP_SCRAM_USERS:  true
      KAFKA_CLIENT_USERS:                 user1
      KAFKA_CLIENT_PASSWORDS:             <set to the key 'client-passwords' in secret 'my-release-kafka-user-passwords'>  Optional: false
      KAFKA_INTER_BROKER_USER:            inter_broker_user
      KAFKA_INTER_BROKER_PASSWORD:        <set to the key 'inter-broker-password' in secret 'my-release-kafka-user-passwords'>  Optional: false
      KAFKA_CONTROLLER_USER:              controller_user
      KAFKA_CONTROLLER_PASSWORD:          <set to the key 'controller-password' in secret 'my-release-kafka-user-passwords'>  Optional: false
    Mounts:
      /bitnami/kafka from data (rw)
      /opt/bitnami/kafka/config/server.properties from kafka-config (rw,path="server.properties")
      /opt/bitnami/kafka/logs from logs (rw)
      /tmp from tmp (rw)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  data:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  data-my-release-kafka-controller-0
    ReadOnly:   false
  kafka-configmaps:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-release-kafka-controller-configuration
    Optional:  false
  kafka-secret-config:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kafka-config:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  tmp:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  scripts:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      my-release-kafka-scripts
    Optional:  false
  logs:
    Type:        EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:      
    SizeLimit:   <unset>
QoS Class:       Burstable
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:          <none>

kubectl -n mypega exec -it my-release-kafka-controller-0 -- /bin/sh
Defaulted container "kafka" out of: kafka, kafka-init (init)

kubectl -n mypega exec -it pega-minikube-0 -- /bin/s
cd /usr/local/tomcat/logs/pega-minikube-0
tail -f PegaRULES.log
