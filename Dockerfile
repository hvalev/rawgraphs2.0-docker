FROM node:14.16.0-alpine3.13 as builder

RUN apk update && apk add --no-cache git && \
    git clone --depth 1 https://github.com/rawgraphs/rawgraphs-app.git /raw

WORKDIR /raw
#https://github.com/yarnpkg/yarn/issues/4890
RUN rm -rf yarn.lock
RUN yarn install
RUN yarn build

FROM node:14.16.0-alpine3.13 as prod
COPY --from=builder /raw/ /

CMD [ "yarn", "start"]