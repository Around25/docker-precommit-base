FROM python:3.7.3-stretch

RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get update && apt-get install -y \
      build-essential \
      curl \
      git \
      libxml2-dev \
      libxslt1-dev \
      ruby \
      ruby-dev \
      nodejs \
      unzip \
      xz-utils \
      zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt

ENV GOLANG_VERSION 1.13.5
ENV PRECOMMIT_VERSION 1.21.0

RUN curl -sSL https://storage.googleapis.com/golang/go$GOLANG_VERSION.linux-amd64.tar.gz \
		| tar -v -C /usr/local -xz

ENV PATH /usr/local/go/bin:$PATH

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN pip install pre-commit==$PRECOMMIT_VERSION
