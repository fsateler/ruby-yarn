FROM ruby:2.3-slim

RUN mkdir -p /usr/src/app /usr/src/app/vendor
WORKDIR /usr/src/app

RUN apt-get update && \
	apt-get install --no-install-recommends -y \
		apt-transport-https \
		build-essential \
		libpq-dev \
		&& \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

# Repo for Node/Yarn
COPY apt-conf /etc/apt

RUN apt-key add /etc/apt/trusted.gpg.d/yarn-pubkey.asc && \
	apt-key add /etc/apt/trusted.gpg.d/nodesource.gpg.asc && \
	apt-get update && \
	apt-get install -y nodejs yarn git && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

