FROM alpine

RUN \
  ls -l /var/run/secrets/kubernetes.io && \
  apk --no-cache add curl && \
  cd /root && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.4/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl && \
  echo "Running get buildrun" && \
  kubectl get buildrun && \
  echo "Running get taskrun" && \
  kubectl get taskrun