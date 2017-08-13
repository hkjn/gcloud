FROM hkjn/alpine

ENV GCLOUD_VERSION=166.0.0-linux-x86_64

RUN apk add --no-cache curl python bash && \
    adduser -D gcloud -s /bin/bash

WORKDIR /home/gcloud
USER gcloud

COPY [".bash*", "./"]

RUN curl -fSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    tar xzfv google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    rm google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    ./google-cloud-sdk/install.sh && \
    bash -c "source ~/google-cloud-sdk/path.bash.inc && \
             echo $PATH && \
             gcloud components install kubectl"

ENTRYPOINT ["bash"]
