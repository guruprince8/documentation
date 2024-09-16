# Kafka Bitnami
helm install my-release oci://registry-1.docker.io/bitnamicharts/kafka -n mypega
Pulled: registry-1.docker.io/bitnamicharts/kafka:30.1.1
Digest: sha256:cbf51e5437b5126ceedf1c9e20b35daf8bc7bc4396421a2551676ebd7c5d1dbc
NAME: my-release
LAST DEPLOYED: Mon Sep 16 13:41:21 2024
NAMESPACE: mypega
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: kafka
CHART VERSION: 30.1.1
APP VERSION: 3.8.0

** Please be patient while the chart is being deployed **

Kafka can be accessed by consumers via port 9092 on the following DNS name from within your cluster:

    my-release-kafka.mypega.svc.cluster.local

Each Kafka broker can be accessed by producers via port 9092 on the following DNS name(s) from within your cluster:

    my-release-kafka-controller-0.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092
    my-release-kafka-controller-1.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092
    my-release-kafka-controller-2.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092

The CLIENT listener for Kafka client connections from within your cluster have been configured with the following security settings:
    - SASL authentication

To connect a client to your Kafka, you need to create the 'client.properties' configuration files with the content below:

security.protocol=SASL_PLAINTEXT
sasl.mechanism=SCRAM-SHA-256
sasl.jaas.config=org.apache.kafka.common.security.scram.ScramLoginModule required \
    username="user1" \
    password="$(kubectl get secret my-release-kafka-user-passwords --namespace mypega -o jsonpath='{.data.client-passwords}' | base64 -d | cut -d , -f 1)";

To create a pod that you can use as a Kafka client run the following commands:

    kubectl run my-release-kafka-client --restart='Never' --image docker.io/bitnami/kafka:3.8.0-debian-12-r5 --namespace mypega --command -- sleep infinity
    kubectl cp --namespace mypega /path/to/client.properties my-release-kafka-client:/tmp/client.properties
    kubectl exec --tty -i my-release-kafka-client --namespace mypega -- bash

    PRODUCER:
        kafka-console-producer.sh \
            --producer.config /tmp/client.properties \
            --broker-list my-release-kafka-controller-0.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092,my-release-kafka-controller-1.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092,my-release-kafka-controller-2.my-release-kafka-controller-headless.mypega.svc.cluster.local:9092 \
            --topic test

    CONSUMER:
        kafka-console-consumer.sh \
            --consumer.config /tmp/client.properties \
            --bootstrap-server my-release-kafka.mypega.svc.cluster.local:9092 \
            --topic test \
            --from-beginning

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - controller.resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/


helm uninstall  my-release -n mypega

kubectl get secret my-release-kafka-user-passwords --namespace mypega -o jsonpath='{.data.client-passwords}' | base64 -d | cut -d , -f 1
--z8Yn35iwf0

$ helm install mypega pega/pega --namespace mypega --values pega.yaml
helm uninstall mypega -n mypega
release "mypega" uninstalled

helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm install my-release bitnami
https://github.com/pegasystems/pega-helm-charts/blob/master/charts/pega/KafkaClusterRequirement.md

