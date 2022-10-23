FROM node:lts-alpine as build
RUN apk add --no-cache libc6-compat > /dev/null 2>&1
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./
COPY ./yarn.lock ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN yarn config set network-timeout 600000 -g && yarn install
WORKDIR /opt/app
COPY ./ .
RUN yarn build

FROM node:lts-alpine
RUN apk add --no-cache libc6-compat
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/app
COPY --from=build /opt/node_modules ./node_modules
COPY --from=build /opt/app/package.json ./package.json
COPY --from=build /opt/app/yarn.lock ./yarn.lock
ENV PATH /opt/node_modules/.bin:$PATH
COPY --from=build /opt/app/build ./build
COPY --from=build /opt/app/config ./config
COPY --from=build /opt/app/database ./database
COPY --from=build /opt/app/public ./public
COPY --from=build /opt/app/favicon.png ./favicon.png
EXPOSE 1337
CMD ["yarn", "start"]
