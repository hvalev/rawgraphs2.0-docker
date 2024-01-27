FROM node:16.20.2-buster-slim as builder

ENV RG_VERSION=v2.0.1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    git \
    python2 \
    make \
    g++ \
    ca-certificates

RUN git clone --depth 1 --branch ${RG_VERSION} https://github.com/rawgraphs/rawgraphs-app.git /raw

WORKDIR /raw
#https://github.com/yarnpkg/yarn/issues/4890
RUN yarn config set registry "http://registry.npmjs.org"
RUN yarn --verbose --network-timeout 1000000 install
RUN yarn build

FROM node:16.20.2-buster-slim as prod
COPY --from=builder /raw/ /

CMD [ "yarn", "start", "--host 0.0.0.0"]