FROM node:19.2.0-buster-slim as builder

RUN apt-get update && apt-get install git python2 make g++ -y && \
    git clone https://github.com/rawgraphs/rawgraphs-app.git /raw

WORKDIR /raw
#https://github.com/yarnpkg/yarn/issues/4890
RUN yarn config set registry "http://registry.npmjs.org"
RUN yarn --network-timeout 1000000 install
#RUN yarn install
RUN yarn build

FROM node:19.2.0-buster-slim as prod
COPY --from=builder /raw/ /

CMD [ "yarn", "start"]
