FROM balser/go-buildbox:1.6

# install Go App Engine SDK
RUN wget -q https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.40.zip
RUN unzip go_appengine_sdk_linux_amd64-1.9.40.zip
RUN mv go_appengine /usr/local/go_appengine

# install the base gcloud SDK
RUN wget -q https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-118.0.0-linux-x86_64.tar.gz
RUN tar -xzf google-cloud-sdk-118.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh
RUN mv google-cloud-sdk /usr/local/google-cloud-sdk

# install docker
RUN yum -y update
RUN echo $'\n\
[dockerrepo]\n\
name=Docker Repository\n\
baseurl=https://yum.dockerproject.org/repo/main/centos/7/\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://yum.dockerproject.org/gpg\n'\
>> /etc/yum.repos.d/docker.repo
RUN yum install -y docker-engine
