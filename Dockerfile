FROM google/cloud-sdk

RUN gcloud auth configure-docker

RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list \
  && curl https://bazel.build/bazel-release.pub.gpg | apt-key add -

RUN apt-get update \
  && apt-get install -y bazel wget bazel-3.4.1 \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3 0 \
  && rm -rf /var/lib/apt/lists/*
