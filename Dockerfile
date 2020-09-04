FROM alpine

RUN \
  echo "Printing service account secret" && \
  ls -l /var/run/secrets/kubernetes.io/serviceaccount && \
  cat /var/run/secrets/kubernetes.io/serviceaccount/token && echo . && echo . && \
  apk --no-cache add curl && \
  cd /root && \
  curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.4/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl && \
  echo . && echo "Running get buildrun" && echo . && \
  kubectl get buildrun && \
  echo . && echo "Running get taskrun" && echo . && \
  kubectl get taskrun