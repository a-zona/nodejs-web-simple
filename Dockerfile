FROM node:lts-alpine

ENV NODE_ENV production
ENV PORT_WEB ${PORT_WEB:-38000}

RUN apk add dumb-init

WORKDIR /usr/src/app

COPY --chown=node:node . /usr/src/app

RUN npm ci --only=production

USER node
CMD ["dumb-init", "npm", "start"]

EXPOSE ${PORT_WEB}
