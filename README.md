Docker-Alpine-Django-Uwsgi-Nginx
=========================

This image contains configuration for basic **nginx**, **uwsgi**, and **django1.6.10** setup.  It is built on **Alpine**.


Quick Start
===========
docker build -t django_nginx .
docker run -p 80:80 django_nginx

Visit http://localhost:80


credits: https://github.com/Kazanz/docker-nginx-uwsgi-django.git

