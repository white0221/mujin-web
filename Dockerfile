FROM ruby:2.5.1

RUN apt-get update -qq \
    && apt-get install -y build-essential libpq-dev libssl-dev wget

RUN mkdir /root/.nvm
ENV NVM_DIR /root/.nvm
ENV NODE_VERSION 7.7.1

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default \
    && npm update -g npm \
    && npm i -g yarn \
    && yarn install \
    && ln -s "$(which node)" /usr/bin/node \
    && ln -s "$(which yarn)" /usr/bin/yarn

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

RUN mkdir /mujin
WORKDIR /mujin

ADD ./Gemfile /mujin
ADD ./Gemfile.lock /mujin
RUN bundle install
