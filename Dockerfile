FROM node:12 as build

LABEL maintainer="rzrbld <razblade@gmail.com>"

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
ENV ADMINIO_PROD false

RUN \
    git clone https://github.com/rzrbld/adminio-ui && \
    cd adminio-ui && \
    npm install -g @angular/cli@9.1.0 && npm install

RUN cd /app/adminio-ui && npm run build


FROM nginx:1.17-alpine

COPY nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/adminio-ui/dist /usr/share/nginx/html

EXPOSE 80

CMD ["/bin/sh", "-c", "envsubst < /usr/share/nginx/html/assest/env.template.js > /usr/share/nginx/html/assets/env.js && nginx -g 'daemon off;'"]
