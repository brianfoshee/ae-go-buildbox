FROM golang:1.9

ENV GOOGLE_CLOUD_SDK_VERSION=196.0.0
ENV GOOGLE_APP_ENGINE_SDK_VERSION=1.9.64
ENV CLOUDSDK_APP_RUNTIME_ROOT=/google-cloud-sdk/platform/ext-runtime/
RUN apt-get update
RUN apt-get install -y apt-utils curl python unzip

# Install the gcloud SDK
RUN curl -fsSLo google-cloud-sdk.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-$GOOGLE_CLOUD_SDK_VERSION-linux-x86_64.tar.gz
RUN tar -xzf google-cloud-sdk.tar.gz
RUN rm google-cloud-sdk.tar.gz
RUN ./google-cloud-sdk/install.sh --quiet

# Install the legacy app engine SDK
RUN curl -fsSLo go_appengine_sdk_linux_amd64-$GOOGLE_APP_ENGINE_SDK_VERSION.zip https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-$GOOGLE_APP_ENGINE_SDK_VERSION.zip
RUN unzip -q go_appengine_sdk_linux_amd64-$GOOGLE_APP_ENGINE_SDK_VERSION.zip
RUN mv go_appengine /usr/local/go_appengine
RUN rm go_appengine_sdk_linux_amd64-$GOOGLE_APP_ENGINE_SDK_VERSION.zip
