FROM lwolf/kubectl_deployer:1.18.3

LABEL maintainer "Vít Steklý <stekly.vit@vs-point.cz>"

ENV AWSCLI_VERSION=1.18.93

RUN apk add --update python python-dev py-pip build-base \
	&& pip install awscli==${AWSCLI_VERSION} --upgrade --user \
	&& mkdir ~/.kube \
	&& mkdir ~/.aws \
	&& apk --purge -v del py-pip \
	&& rm /var/cache/apk/*

