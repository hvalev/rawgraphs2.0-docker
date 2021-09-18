FROM node:16.9.1-alpine3.13 as builder

RUN apk update && apk add --no-cache git python2 make g++ && \
    git clone --depth 1 https://github.com/rawgraphs/rawgraphs-app.git /raw

WORKDIR /raw
#https://github.com/yarnpkg/yarn/issues/4890
RUN yarn config set registry "http://registry.npmjs.org"
RUN yarn --network-timeout 1000000 install
RUN yarn build

FROM node:16.9.1-alpine3.13 as prod
COPY --from=builder /raw/ /

CMD [ "yarn", "start"]