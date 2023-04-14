#!/usr/bin/env -S bash -c "docker run --rm --cap-drop=all -v \${PWD}/img:/app/img -it \$(docker build . >&2 && docker build -q .) \$@"
FROM ubuntu:20.04

WORKDIR /app

# install
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
	&& apt install -y python3 \
	&& apt install -y xvfb xterm \
	&& apt install -y expect curl nano wget \
	&& apt autoremove \
	&& apt clean
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
	&& apt update \
	&& apt install -y nodejs \
	&& apt autoclean \
	&& apt autoremove \
	&& apt clean
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
	&& apt install -y ./google-chrome-stable_current_amd64.deb \
	&& rm ./google-chrome-stable_current_amd64.deb
RUN apt update \
	&& apt install -y imgp python3-pip \
	&& pip3 install pillow \
	&& apt autoclean \
	&& apt autoremove \
	&& apt clean




COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json

RUN useradd -ms /bin/bash chrome_runuser
RUN chown -R chrome_runuser:chrome_runuser /app
USER chrome_runuser

RUN npm install

COPY src /app/src
COPY config.txt /app/config.txt

CMD ./src/run.sh


