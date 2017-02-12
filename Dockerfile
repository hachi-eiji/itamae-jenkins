FROM hachiyae/rbenv-on-amzn-linux:latest

MAINTAINER Eiji Hachiya<hachiyae@gmail.com>

WORKDIR /itamae
COPY ./itamae .

RUN yum -y update \
  && yum -y install python27-pip \
  && pip install supervisor \
  && echo -e "[supervisord]\nnodaemon=true\n[program:nginx]\ncommand=nginx -g 'daemon off;'\nautostart=true\nautorestart=true\n[program:php-fpm]\ncommand=php-fpm --nodaemonize\nautostart=true\nautorestart=true" > /usr/local/etc/supervisord.conf \
  && bash -l bundle install --path .vendor/bundle \
  && bash -l bundle exec itamae local --node-yaml node.yml ./roles/php-server.rb

EXPOSE 80 443
ENTRYPOINT ["supervisord", "-c", "/usr/local/etc/supervisord.conf"]
