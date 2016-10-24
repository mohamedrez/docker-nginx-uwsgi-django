FROM python:2.7-alpine

MAINTAINER "Obytes"


RUN apk add --update \
    nginx \
    supervisor \
    python-dev \
    build-base \
    linux-headers \
    pcre-dev \
    py-pip \
    vim \
  && rm -rf /var/cache/apk/* && \
  chown -R nginx:www-data /var/lib/nginx

RUN pip install uwsgi

ADD . /app
WORKDIR /app

RUN pip install Django==1.6.10

RUN mkdir -p /run/nginx
RUN mkdir /etc/nginx/sites-enabled
RUN rm /etc/nginx/nginx.conf
RUN ln -s /app/nginx/nginx.conf /etc/nginx/
RUN ln -s /app/nginx/nginx-app.conf /etc/nginx/sites-enabled/
RUN rm /etc/supervisord.conf
RUN ln -s /app/supervisord/supervisord.conf /etc/

EXPOSE 80

CMD ["supervisord", "-n"]
