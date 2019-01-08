FROM ruby:2.5.1
RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev libssl-dev

RUN mkdir /root/.nvm
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 7.7.1

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm update -g npm \
    && npm i -g yarn
RUN mkdir /mujin
WORKDIR /mujin
