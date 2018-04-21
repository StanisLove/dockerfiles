FROM ruby:2.5.1

RUN wget https://nodejs.org/dist/v9.11.1/node-v9.11.1-linux-x64.tar.xz
RUN tar --strip-components 1 -xf node-v9.11.1-linux-x64.tar.xz

RUN apt-get clean && apt-get update && apt-get install -y curl apt-transport-https && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && apt-get install -y yarn

RUN apt-get install -y --no-install-recommends postgresql-client
