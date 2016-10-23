FROM hkjn/alpine

ENV GCLOUD_VERSION 131.0.0-linux-x86_64

ENV USER gcloud

RUN apk add --no-cache curl python bash && \
    adduser -D $USER -s /bin/bash

WORKDIR /home/$USER
USER $USER

RUN curl -fSLO https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    tar xzfv google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    rm google-cloud-sdk-${GCLOUD_VERSION}.tar.gz && \
    ./google-cloud-sdk/install.sh && \
    bash -c "source ~/.bashrc && gcloud components install kubectl"

ENTRYPOINT ["bash"]