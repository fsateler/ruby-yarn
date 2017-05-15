FROM ruby:2.3

RUN mkdir -p /usr/src/app /usr/src/app/vendor
WORKDIR /usr/src/app

RUN apt-get update && apt-get upgrade -y apt-transport-https && apt-get clean

# Repo for Yarn
COPY apt-conf/yarn-pubkey.asc apt-conf/nodesource.gpg.asc /etc/apt/trusted.gpg.d/
COPY apt-conf/yarn.list apt-conf/node.list /etc/apt/sources.list.d/
RUN apt-key add /etc/apt/trusted.gpg.d/yarn-pubkey.asc && apt-key add /etc/apt/trusted.gpg.d/nodesource.gpg.asc

# Se necesita para webpack
RUN apt-get update && apt-get install -y nodejs yarn git\
	&& apt-get clean

