FROM ubuntu:16.04
RUN apt-get update && apt-get install --no-install-recommends -y software-properties-common
RUN add-apt-repository ppa:ubuntu-lxc/lxd-stable && apt-get update
RUN apt-get install --no-install-recommends -y golang git build-essential libsystemd-dev
ENV GOPATH /root/build
ADD . /root/build/src/journald-cloudwatch-logs
WORKDIR /root/build/src/journald-cloudwatch-logs
RUN go build -v
RUN sha256sum ./journald-cloudwatch-logs
CMD journald-cloudwatch-logs
