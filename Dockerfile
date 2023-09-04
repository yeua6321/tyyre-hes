FROM alpine AS builder
RUN apk add --no-cache git
RUN git clone -b v3 https://github.com/Hideipnetwork/hideipnetwork-web.git /hnet

FROM node:alpine
EXPOSE 80
WORKDIR /usr/app
USER 10014

COPY --from=builder /hnet .
RUN npm install
CMD ["npm", "start"]
